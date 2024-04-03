<?php
//in the name of Allah

echo "in the name of Allah\n";
echo "la ilaha illa Allah mohammed rassoul Allah\n";

$bismi_allah_str = htmlspecialchars("/bismi_allah/la_ilaha_illa_allah");
echo $bismi_allah_str . "\n";
$bismi_allah_str = explode("/", $bismi_allah_str);
$bismi_allah_str = array_shift($bismi_allah_str);
print_r($bismi_allah_str);

echo htmlspecialchars("\"");

?>
