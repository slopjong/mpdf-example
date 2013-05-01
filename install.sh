#!/bin/bash

git clone --depth=1 git://github.com/finwe/mpdf.git
cp fonts/sansation/*.ttf mpdf/ttfonts
cp fonts/noto_sans/*.ttf mpdf/ttfonts

# remove the closing php tag as this is bad style
sed -i "s/\?>//g" mpdf/config_fonts.php

# add the new fonts to the configuration files
echo "\$this->fontdata['sansation'] = array( 'R' => 'Sansation_Regular.ttf', 'B' => 'Sansation_Bold.ttf', 'I' => 'Sansation_Italic.ttf', 'BI' => 'Sansation_Bold_Italic.ttf');" >> mpdf/config_fonts.php
echo "\$this->fontdata['notosans'] = array( 'R' => 'NotoSans-Regular.ttf', 'B' => 'NotoSans-Bold.ttf', 'I' => 'NotoSans-Italic.ttf', 'BI' => 'NotoSans-BoldItalic.ttf');" >> mpdf/config_fonts.php
