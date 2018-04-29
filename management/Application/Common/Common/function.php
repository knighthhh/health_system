<?php
//上传单张图片函数
function uploadOne($imgName, $dirName, $thumb = array())
{
    $ic     = C('IMAGE_CONFIG');
    $upload = new \Think\Upload(array(
        'rootPath' => $ic['rootPath'],
        'ext'      => $ic['ext'],
    ));
    $upload->savePath = $dirName . "/";
    $info             = $upload->upload(array($imgName => $_FILES[$imgName]));
    if (!$info) {
        return array(
            'ok'    => 0,
            'error' => $upload->getError(),
        );
    } else {
        $ret['ok'] = 1;
        //生成原图的名字
        $ret['images'][0] = $logoName = $info[$imgName]['savepath'] . $info[$imgName]['savename'];
        if ($thumb) {
            $image = new \Think\Image();
            foreach ($thumb as $k => $v) {
                //生成缩略图的名字
                $ret['images'][$k + 1] = $info[$imgName]['savepath'] . "thumb_" . $k . "_" . $info[$imgName]['savename'];
                $image->open($ic['rootPath'] . $logoName);
                //生成缩略图并保存在指定目录中
                $image->thumb($v[0], $v[1])->save($ic['rootPath'] . $ret['images'][$k + 1]);
            }
        }

    }
    return $ret;
}

//删除图片函数
function delImg($oldPath)
{
    $ic = C('IMAGE_CONFIG');
    foreach ($oldPath as $k => $v) {
        unlink($ic['rootPath'] . $v);
    }

}

//显示图片函数封装
function showImage($url, $width = '', $height = '')
{
    $ic = C('IMAGE_CONFIG');
    if ($width) {
        $width = "width='$width'";
    }

    if ($height) {
        $height = "height='$height'";
    }

    echo "<img $width $height layer-src='{$ic['viewPath']}$url' src='{$ic['viewPath']}$url' />";

}

function getFirstCharter($str)
{
    if (empty($str)) {return '';}
    $fchar = ord($str{0});
    if ($fchar >= ord('A') && $fchar <= ord('z')) {
        return strtoupper($str{0});
    }

    $s1  = iconv('UTF-8', 'gb2312', $str);
    $s2  = iconv('gb2312', 'UTF-8', $s1);
    $s   = $s2 == $str ? $s1 : $str;
    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;
    if ($asc >= -20319 && $asc <= -20284) {
        return 'A';
    }

    if ($asc >= -20283 && $asc <= -19776) {
        return 'B';
    }

    if ($asc >= -19775 && $asc <= -19219) {
        return 'C';
    }

    if ($asc >= -19218 && $asc <= -18711) {
        return 'D';
    }

    if ($asc >= -18710 && $asc <= -18527) {
        return 'E';
    }

    if ($asc >= -18526 && $asc <= -18240) {
        return 'F';
    }

    if ($asc >= -18239 && $asc <= -17923) {
        return 'G';
    }

    if ($asc >= -17922 && $asc <= -17418) {
        return 'H';
    }

    if ($asc >= -17417 && $asc <= -16475) {
        return 'J';
    }

    if ($asc >= -16474 && $asc <= -16213) {
        return 'K';
    }

    if ($asc >= -16212 && $asc <= -15641) {
        return 'L';
    }

    if ($asc >= -15640 && $asc <= -15166) {
        return 'M';
    }

    if ($asc >= -15165 && $asc <= -14923) {
        return 'N';
    }

    if ($asc >= -14922 && $asc <= -14915) {
        return 'O';
    }

    if ($asc >= -14914 && $asc <= -14631) {
        return 'P';
    }

    if ($asc >= -14630 && $asc <= -14150) {
        return 'Q';
    }

    if ($asc >= -14149 && $asc <= -14091) {
        return 'R';
    }

    if ($asc >= -14090 && $asc <= -13319) {
        return 'S';
    }

    if ($asc >= -13318 && $asc <= -12839) {
        return 'T';
    }

    if ($asc >= -12838 && $asc <= -12557) {
        return 'W';
    }

    if ($asc >= -12556 && $asc <= -11848) {
        return 'X';
    }

    if ($asc >= -11847 && $asc <= -11056) {
        return 'Y';
    }

    if ($asc >= -11055 && $asc <= -10247) {
        return 'Z';
    }

    return null;
}

function uploadExcel($excelName, $dirName)
{
    header("Content-Type:text/html;charset=utf-8");
    $upload = new \Think\Upload(array(
        'rootPath' => './Public/Uploads/',
    )); // 实例化上传类
    $upload->maxSize  = 3145728; // 设置附件上传大小
    $upload->exts     = array('xls', 'xlsx'); // 设置附件上传类
    $upload->savePath = $dirName . '/'; // 设置附件上传目录
    // 上传文件
    //dump($excelName);die;
    $info = $upload->uploadOne($_FILES[$excelName]);
    //dump($info);die;
    $filename = './Public/Uploads/' . $info['savepath'] . $info['savename'];
    $exts     = $info['ext'];
    //print_r($info);exit;
    if (!$info) {
// 上传错误提示错误信息
        echo $upload->getError();
    } else {
// 上传成功
        return import_excel($filename, $exts);

    }
}

/**
 * 导入excel表格
 * @Author   王哲
 * @DateTime 2017-07-06
 * @param    [type]     $filename [description]
 * @param    string     $exts     [description]
 * @return   [type]               [description]
 */
function import_excel($filename, $exts = 'xls')
{
    //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
    import("Org.Util.PHPExcel");
    //创建PHPExcel对象，注意，不能少了\
    $PHPExcel = new \PHPExcel();
    //如果excel文件后缀名为.xls，导入这个类
    if ($exts == 'xls') {
        import("Org.Util.PHPExcel.Reader.Excel5");
        $PHPReader = new \PHPExcel_Reader_Excel5();
    } else if ($exts == 'xlsx') {
        import("Org.Util.PHPExcel.Reader.Excel2007");
        $PHPReader = new \PHPExcel_Reader_Excel2007();
    }

    //载入文件
    $PHPExcel = $PHPReader->load($filename);
    //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
    $currentSheet = $PHPExcel->getSheet(0);
    //获取总列数
    $allColumn = $currentSheet->getHighestColumn();
    //获取总行数
    $allRow = $currentSheet->getHighestRow();
    //将遍历结果拼成数组
    $data = array();
    //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
    for ($currentRow = 2; $currentRow <= $allRow; $currentRow++) {
        $i = 0;
        //从哪列开始，A表示第一列
        for ($currentColumn = 'A'; $currentColumn <= $allColumn; $currentColumn++) {
            //数据坐标
            $address = $currentColumn . $currentRow;
            //读取到的数据，保存到数组$arr中
            $cell = $currentSheet->getCell($address)->getValue();
            //$cell = $data[$currentRow][$currentColumn];
            if ($cell instanceof PHPExcel_RichText) {
                $cell = $cell->__toString();
            }
            $data[$currentRow - 2][$i] = $cell;
            $i++;
        }

    }
    return $data;
}

/**
 * @param lat 纬度 lon 经度 raidus 单位米
 * return minLat,minLng,maxLat,maxLng
 */

function getAround($lat, $lon, $raidus)
{
    $PI = 3.14159265;

    $latitude  = $lat;
    $longitude = $lon;

    $degree     = (24901 * 1609) / 360.0;
    $raidusMile = $raidus;

    $dpmLat    = 1 / $degree;
    $radiusLat = $dpmLat * $raidusMile;
    $minLat    = $latitude - $radiusLat;
    $maxLat    = $latitude + $radiusLat;

    $mpdLng    = $degree * cos($latitude * ($PI / 180));
    $dpmLng    = 1 / $mpdLng;
    $radiusLng = $dpmLng * $raidusMile;
    $minLng    = $longitude - $radiusLng;
    $maxLng    = $longitude + $radiusLng;
// echo $minLat."#".$maxLat."@".$minLng."#".$maxLng;
    $data           = array();
    $data['minLat'] = $minLat;
    $data['maxLat'] = $maxLat;
    $data['minLng'] = $minLng;
    $data['maxLng'] = $maxLng;
    return $data;
}

/**
 * 用户权限验证
 * @Author   王哲
 * @DateTime 2017-07-06
 * @param    string     $name 规则名称
 * @param    int        $uid  用户ID
 * @param    string     $t    返回true后执行的语句
 * @return   string           若验证正确则执行语句，否则返回错误信息
 */
function authCheck($name,$uid,$t){
    $f="";
    $auth = new \Think\auth();
    return $auth->check($name,$uid)?$t:$f;
}



