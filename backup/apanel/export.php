<?php
require_once('../includes/initialize.php');

$records = $db->query("SELECT * FROM tbl_subscribers ORDER BY sortorder DESC ");
$num = $db->num_rows($records);

$format = 'xlsx';
require_once SITE_ROOT . 'includes/PHPExcel.php';

$file = "subscribers_list_" . date('Y_m_d_H_i_s') . ".$format";
$sheet_title = 'Subscribers List';

$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Evonymon")
    ->setLastModifiedBy("Evonymon")
    ->setTitle('Subscribers List — ' . date('Y-m-d'))
    ->setSubject('Subscribers List — ' . date('Y-m-d'));


// Set some styles
$styleArrayTitle = array(
    'font' => array('bold' => true),
    'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT)
);

$styleArrayData = array('alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT));


// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle($sheet_title);
$objPHPExcel->getActiveSheet()->mergeCells('A1:C1');
$objPHPExcel->getActiveSheet()->getStyle('A1:C1')->getFont()->setSize(15);
$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->setCellValue('A1', 'Evonymon');


//Add Title Line
$titles = array(
    "S.N.",
    "Full Name",
    "Email Address"
);

// =================================z=======================>
$start_char = chr(65);
$end_char = chr(65 + count($titles) - 1);
$letterRange = createColumnsArray('C');
foreach ($letterRange as $j => $c) {
    $objPHPExcel->setActiveSheetIndex(0)->setCellValue("{$c}2", @$titles[$j]);
}

// Add Data Line
$sn = 1;
if ($num > 0) {
    $i = 0;
    while ($row = $db->fetch_object($records)) {
        $data = array(
            $sn++,
            $row->title,
            $row->mailaddress
        );

        $letterRange = createColumnsArray('C');
        foreach ($letterRange as $j => $c) {
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue("{$c}" . ($i + 3), @$data[$j]);
        }

        $i++;
    }
}


$styleArray = array(
    'borders' => array(
        'allborders' => array(
            'style' => PHPExcel_Style_Border::BORDER_THIN
        )
    )
);

$objPHPExcel->getActiveSheet()->getStyle('A3:C3')->applyFromArray($styleArray);

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle($sheet_title);

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);

//auto column width
// PHPExcel_Shared_Font::setAutoSizeMethod(PHPExcel_Shared_Font::AUTOSIZE_METHOD_EXACT);
foreach (range('A', 'C') as $columnID) {
    $objPHPExcel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
}


if ($format == 'xlsx') {

    // Redirect output to a client's web browser (Excel2007)
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="' . $file . '"');
    header('Cache-Control: max-age=0');

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
} else {

    // Redirect output to a client's web browser (Excel5)
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="' . $file . '"');
    header('Cache-Control: max-age=0');

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
}

$objWriter->save('php://output');

exit;

?>