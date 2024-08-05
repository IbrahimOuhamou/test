<?php
//in the name of Allah

echo "in the name of Allah\n";

$arr = ['bismi_allah' => 'in the name of Allah', 'Allah Akbar' => "Allah is the greatest"];
var_dump($arr);

print(key($arr));

echo "=================================\n";
echo isset($bool) ? 'TRUE' : 'NONE';

$var =  $arr['astaghfiro Allah'] ?? 'astaghfiro Allah';

echo "\n" . $var;

for($i=0, $y=2; $i < 12; $i++)
{ 
    echo "y == $y \n";
}

echo "=================================\n";
function bismiAllahFunc(int $num): ?int {
    if (0 < $num) return $num;
    return null;
}

echo bismiAllahFunc(-12) ?? exit() . "\n";
echo "alhamdo li Allah got here\n";

?>
