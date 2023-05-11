<?php
// include_once 'top.php';
include_once 'models/Kartu.php';
// include_once 'menu.php';
$model = new Kartu();
$data_kartu = $model->dataKartu();

// foreach($data_produk as $row){
//     print $row['kode'];
// }

?>
<h1 class="mt-4">Tables</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
    <li class="breadcrumb-item active">Tables</li>
</ol>
<div class="card mb-4">
    <div class="card-body">
        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
        .
    </div>
</div>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        DataTable Example
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th>Nama</th>
                    <th>Diskon</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Nama</th>
                    <th>Diskon</th>
                </tr>
            </tfoot>
            <tbody>
                <?php
                $no = 1;
                foreach($data_kartu as $row) {
                ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $row['nama'] ?></td>
                    <td><?= $row['diskon'] ?></td>
                    </tr>
                <?php
                $no++;
            }
            ?>
            </tbody>
        </table>
    </div>
</div>
</div>

                <?php
        // include_once 'bottom.php';
                ?>