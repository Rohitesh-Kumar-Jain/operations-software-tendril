
<p class="note">
    <strong>Sampled Queries</strong> pulled from SHOW FULL PROCESSLIST snapshots (10s interval) in <a href="/activity">activity</a>.
</p>

<style>
#sampled-queries .right {
    text-align: right;
}
#sampled-queries tr.sample {
    font-size: smaller;
    color: #999;
}
</style>

<form method="GET" class="search">
    <table cellspacing="0" cellpadding="0">
    <tr>
        <th>Host</th>
        <th>User</th>
        <th>Schema</th>
        <th>Query</th>
        <th>Hours</th>
        <th></th>
    </tr>
    <tr>
        <td>
            <input type="text" name="host" value="<?= escape(pkg()->request('host')) ?>" placeholder="regex" />
        </td>
        <td>
            <input type="text" name="user" value="<?= escape(pkg()->request('user')) ?>" placeholder="regex" />
        </td>
        <td>
            <input type="text" name="schema" value="<?= escape(pkg()->request('schema')) ?>" placeholder="regex" />
        </td>
        <td>
            <select name="qmode">
                <option value="eq" <?= pkg()->request('qmode') == 'eq' ? ' selected': '' ?>>=~</option>
                <option value="ne" <?= pkg()->request('qmode') == 'ne' ? ' selected': '' ?>>!~</option>
            </select>
            <input type="text" name="query" value="<?= escape(pkg()->request('query')) ?>" placeholder="regex" />
        </td>
        <td>
            <input style="width: 2em" type="text" name="hours" value="<?= escape(pkg()->request('hours')) ?>" placeholder="#" />
        </td>
        <td>
            <input type="submit" value="Search" />
        </td>
    </tr>
    </table>
</form>

<table id="sampled-queries">

<tr>
    <th class="right">
        Hits
    </th>
    <th class="right">
        Tmax
    </th>
    <th class="right">
        Tavg
    </th>
    <th class="right">
        Tsum
    </th>
    <th class="">
        Hosts
    </th>
    <th class="">
        Users
    </th>
    <th class="">
        Schemas
    </th>
</tr>

<?php

$servers = sql::query('tendril.servers')->fetch_all();

foreach ($rows as $row)
{
    $hosts = array();
    foreach (explode(',', $row['servers']) as $server_id)
    {
        $host = new Host(expect($servers, $server_id, 'array', $server_id));
        $hosts[] = tag('a', array(
            'href' => sprintf('/host/view/%s/%d', $host->name(), $host->port()),
            'html' => escape($host->describe()),
        ));
    }

    $hosts  = join(', ', $hosts);
    $users  = str_replace(',', ', ', $row['users']);
    $dbs    = str_replace(',', ', ', $row['dbs']);
    $sample = str_replace(',', ', ', $row['sample']);

    $shost = new Host(expect($servers, $row['sample_server_id'], 'array', $row['sample_server_id']));
    $sample = sprintf('%s /* %s %s %s %ds */', $sample, $row['checksum'], $shost->describe(), $row['sample_db'], $row['sample_time']);

    if (($ips = find_ipv4($sample)) && ($name = dns_reverse($ips[0])) && $name != $ips[0])
    {
        $sample = sprintf('%s /* %s */', $sample, $name);
    }

    $cells = array(
        tag('td', array(
            'title' => 'Hits',
            'class' => 'right',
            'html' => tag('a', array(
                'href' => sprintf('/report/sampled_queries_checksum?checksum=%s&host=%s&user=%s&schema=%s&hours=%s',
                    $row['checksum'],
                    urlencode(pkg()->request('host')),
                    urlencode(pkg()->request('user')),
                    urlencode(pkg()->request('schema')),
                    urlencode(pkg()->request('hours'))
                ),
                'html' => $row['hits'],
            )),
        )),
        tag('td', array(
            'title' => 'Tmax',
            'class' => 'right',
            'html' => $row['max_time'],
        )),
        tag('td', array(
            'title' => 'Tavg',
            'class' => 'right',
            'html' => number_format($row['avg_time'], 0),
        )),
        tag('td', array(
            'title' => 'Tsum',
            'class' => 'right',
            'html' => number_format($row['sum_time'], 0),
        )),
        tag('td', array(
            'html' => $hosts,
        )),
        tag('td', array(
            'html' => escape($users),
        )),
        tag('td', array(
            'html' => escape($dbs),
        )),
    );

    print tag('tr', array(
        'html' => $cells,
    ));

    $cells = array(
        tag('td', array(
            'colspan' => 7,
            'html' => escape($sample),
        ))
    );

    print tag('tr', array(
        'class' => 'sample',
        'html' => $cells,
    ));

}

?>

</table>
