
<style>
nav {
    display: inline-block;
    float: right;
}
input[name=host] {
    width: 20em !important;
}
</style>

<form method="GET" class="search">
    <table cellspacing="0" cellpadding="0">
    <tr>
        <th>Host</th>
        <th></th>
        <th></th>
    </tr>
    <tr>
        <td>
            <input type="text" name="host" list="hints" value="<?= escape(pkg()->request('host')) ?>" placeholder="regex" />
        </td>
        <td>
            <input type="submit" value="Search" />
        </td>
        <td>
            <nav>
                [ <a href="https://grafana.wikimedia.org/dashboard/db/mysql-aggregated">MySQL aggregated metrics</a> | <a href="https://grafana.wikimedia.org/dashboard/db/prometheus-cluster-breakdown?var-datasource=eqiad%20prometheus%2Fops&var-cluster=mysql&cluster=mysql">MySQL server metrics</a> ]
            </nav>
        </td>
    </tr>
    </table>
</form>


<?php include 'table.php'; ?>

<datalist id="hints">
    <option value="masters">
    <option value="slaves:">
    <option value="family:">
    <option value="slave-per-master">
</datalist>
