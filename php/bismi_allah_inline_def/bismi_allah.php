<?php
// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed rassoul Allah

echo 'بسم الله الرحمن الرحيم' . "\n";

enum BismiAllahEnum {case BismiAllah; case AlhamdoLiAllah;}

function bismiAllah(BismiAllahEnum $name)
{
    echo 'alhamdo li Allah no errors';
}

bismiAllah(BismiAllahEnum::BismiAllah);

