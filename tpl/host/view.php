<style>

table.host-vars {
    width: 100%;
    table-layout: fixed;
    overflow: hidden;
}

#graphs {
    width: 100%;
}

#graphs .group .chart {
    display: inline-block;
    margin-bottom: 20px;
    height: 300px;
    width: 48.5%;
    background: #eee;
    margin-right: 1%;
    border: 1px solid #ccc;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

#graphs-blurb {
    margin: 0 0 1.5em 0;
}

</style>

<h3>
    <?= escape($host->describe()) ?> : replication family
</h3>

<?php

include 'table.php';

?>

<nav>
    <a href="/chart?hosts=<?= urlencode($host->m_master_id ? $host->name_short(): sprintf('family:%s', $host->name_short())) ?>&vars=questions&mode=delta">family chart</a>
    <a href="/report/slow_queries?host=<?= urlencode($host->m_master_id ? $host->name_short(): sprintf('family:%s', $host->name_short())) ?>&hours=1">family slow queries</a>
</nav>

<h3>
    <?= escape($host->describe()) ?> : graphs
</h3>

<div id="graphs-blurb">
    <nav style="display: inline-block;">
        [ <a href="https://grafana.wikimedia.org/dashboard/db/cluster-overview?cluster=mysql&orgId=1&var-datasource=<?= preg_match('/^(db2|labsdb2|es2|pc2|dbstore2|dbproxy2)/', $host->name_short()) ? 'codfw' : 'eqiad' ?>%20prometheus%2Fops&var-cluster=mysql&var-instance=<?= $host->name_short() ?>">Prometheus host metrics</a> | <a href="https://grafana.wikimedia.org/dashboard/db/mysql?&var-server=<?= $host->name_short() ?>&var-port=<?= $host->port == 3306 ? 9104 : $host->port + 1000 ?>&var-dc=<?= preg_match('/^(db2|labsdb2|es2|pc2|dbstore2|dbproxy2)/', $host->name_short()) ? 'codfw' : 'eqiad' ?>%20prometheus%2Fops">MySQL instance metrics</a> | <a href="https://icinga.wikimedia.org/cgi-bin/icinga/status.cgi?host=<?= $host->name_short() ?>&nostatusheader">icinga</a>
    </nav>
</div>

<div id="graphs">

    <script type="text/javascript">

    google.setOnLoadCallback(drawCharts);

    function drawChart(div, title, description, fields, type)
    {
        var data = {
            'type' : type,
            'fields' : fields,
        };

        $.getJSON('/host/chart/<?= $host->name() ?>/<?= $host->port ?>', data, function(r) {

            if (r[0] == 'ok')
            {
                var data = new google.visualization.DataTable();

                var cols = r[1][0];
                var rows = r[1][1];

                for (var j in cols)
                {
                    data.addColumn(cols[j][1], cols[j][0]);
                }

                for (var i = 0; i < rows.length; i++)
                {
                    var point = [];
                    for (var j in cols)
                    {
                        if (cols[j][1] == 'date' || cols[j][1] == 'datetime')
                            point.push(new Date(rows[i][j].replace(/-/g, '/')));
                        else
                            point.push(rows[i][j]);
                    }

                    data.addRow(point);
                }

                var options = {
                    'title'  : title + ' -- ' + description,
                    'width'  : '50%',
                    'height' : '100%',
                    'legend' : { 'position': 'top' },
                    'chartArea' : { 'width': '85%', 'left': '12%' }
                };

                var chart = new google.visualization.AreaChart($('#'+div).get(0));
                chart.draw(data, options);

                //setTimeout(function() { drawChart(div, title, description, fields, type); }, 60*1000);
            }
        });
    }

    function drawCharts() {

    <?php

    $groups = '';

    foreach ($graphs as $title => $row)
    {
        $group = '';

        foreach ($row as $i => $report)
        {
            $hash = md5(join(':', array($i, $title, $report->fields())));

            $group .= tag('div', array(
                'id' => 'chart' . $hash,
                'class' => 'chart',
            ));

            ?>

            drawChart(
                'chart<?= $hash ?>',
                <?= json_encode($title) ?>,
                <?= json_encode($report->description()) ?>,
                "<?= $report->fields() ?>",
                "<?= get_class($report) ?>"
            );

            <?php
        }

        $groups .= tag('div', array(
            'class' => 'group',
            'html' => $group,
        ));
    }

    ?>

    }

    </script>

    <div id="groups">

        <?= $groups ?>

    </div>

</div>
