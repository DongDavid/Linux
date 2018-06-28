<?php
// echo __DIR__;
// echo "\n";
// echo __FILE__;
// echo "\n";
// echo dirname(__FILE__);
// exit();
function checkUrl(array $urls)
{
    $log = '';

    foreach ($urls as $url) {
        $log = implode('|', http_get($url));
        setLog($log);
    }

    return true;
}
function setLog(string $log)
{
    $filePath = dirname(__FILE__) . '/log.md';
    file_put_contents($filePath, $log . "\r", FILE_APPEND);
}
function http_get($url)
{
    $oCurl = curl_init();
    curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
    curl_setopt($oCurl, CURLOPT_URL, $url);
    curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($oCurl, CURLOPT_VERBOSE, 0);
    curl_setopt($oCurl, CURLOPT_HEADER, 0);
    curl_setopt($oCurl, CURLOPT_CONNECTTIMEOUT, 10);
    $sContent = curl_exec($oCurl);
    $aStatus  = curl_getinfo($oCurl);
    curl_close($oCurl);
    $r['start_time']         = date('Y-m-d H:i:s');
    $r['url']                = $url;
    $r['remote_ip']          = $aStatus['primary_ip'];
    $r['remote_port']        = $aStatus['primary_port'];
    $r['total_time']         = $aStatus['total_time'];
    $r['namelookup_time']    = $aStatus['namelookup_time'];
    $r['connect_time']       = $aStatus['connect_time'];
    $r['pretransfer_time']   = $aStatus['pretransfer_time'];
    $r['starttransfer_time'] = $aStatus['starttransfer_time'];
    $r['redirect_url']       = $aStatus['redirect_url'];
    $r['content']            = substr($sContent, 0, 60);
    // $r['content'] = '';
    return $r;
}
function mkLog()
{
    $title = [
        "时间",
        "链接",
        "远程主机IP",
        "远程主机端口",
        "total_time",
        "namelookup_time",
        "connect_time",
        "pretransfer_time",
        "starttransfer_time",
        "redirect_url",
        "响应内容(255字节)",
    ];
    $counts = count($title);
    $title  = implode("|", $title);
    setLog($title);
    $tag = array_fill(0, $counts, '---');
    $tag = implode('|', $tag);
    setLog($tag);
}
$urls = [
    "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=ACCESS_TOKEN",
    "https://www.baidu.com",
];
// mkLog();
checkUrl($urls);
