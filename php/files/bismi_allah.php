<?php
//in the name of Allah

echo "in the name of Allah\n";
if(!is_dir('cache'))
{
    echo "'cache/' does not exist\n";
    mkdir('cache');
}
else
{
    echo "'cache/' exists\n";
}

if(!isset($argv[1])){exit();}

if(file_exists('cache/bismi_allah_' . $argv[1]))
{
    echo file_get_contents('cache/bismi_allah_' . $argv[1]);
}
else
{
    if(!file_exists('cache/' . $argv[1] . '_request'))
    {
        $f = fopen('cache/' . $argv[1] . '_request', "w");
        fwrite($f, date('F Y h:i:s A'));
        fclose($f);
    
        $pid = pcntl_fork();
        if(-1 === $pid)
        {
            echo "failed to fork\n";
        }
        elseif($pid)
        {
            exit(); //we are done here, alhamdo li Allah
        }
        else 
        {
            //child proccess
            system("~/test/c/bismi_allah/bin/bismi_allah > cache/bismi_allah_$argv[1]");
            system('rm cache/' . $argv[1] . '_request');
        }
    }
}

?>
