<?php

$css = file_get_contents("assets/css/style.css");
$html = file_get_contents("assets/templates/body.txt");
$header = file_get_contents("assets/templates/header.txt");
$footer = file_get_contents("assets/templates/footer.txt");

include(realpath("mpdf/mpdf.php"));
        
$mpdf=new mPDF('', 'A4', 0, '', 0, 0, 0, 0, 0, 0, 'P');

$mpdf->SetHTMLHeader($header);
$mpdf->SetHTMLFooter($footer);

$mpdf->SetTopMargin('30%');

//$mpdf->SetHTMLFooter($footer);
$mpdf->WriteHTML($css, 1);
$mpdf->WriteHTML($html);
$mpdf->Output();