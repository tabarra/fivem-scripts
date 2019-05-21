<?php
require('init.php');

if(empty($_GET['id']) || !ctype_digit($_GET['id'])){
	die('Invalid ID bruh');
}

$sql = 'SELECT 
	uData.dkey,
	uData.dvalue
FROM vrp_user_data AS uData 
WHERE
	uData.user_id = ? AND
	uData.dkey = "vRP:datatable"
UNION ALL
SELECT 
	sData.dkey,
	sData.dvalue
FROM vrp_srv_data AS sData 
WHERE 
	sData.dkey = ? OR 
	sData.dkey LIKE ?
';
	
$uid = $_GET['id'];
$stmt = $pdo->prepare($sql);
$stmt->execute([
	$uid,
	"chest:u{$uid}home",
	"chest:u{$uid}veh%"
]);
$res = $stmt->fetchAll();
//~r($data);
foreach($res as $field) {
	$title = '';
	$list = '';
	if($field->dkey == "vRP:datatable"){
		$title = "INVENTÁRIO";
		$inventory = @json_decode($field->dvalue)->inventory;
		foreach($inventory as $itemName => $itemProps){
			$list .= "{$itemProps->amount}\t{$itemName}\n";
		}
	}else{
		$title = str_replace("chest:u{$uid}", '', $field->dkey);
		$inventory = @json_decode($field->dvalue);
		foreach($inventory as $itemName => $itemProps){
			$list .= "{$itemProps->amount}\t{$itemName}\n";
		}
	}
	if(strlen($list)){
		echo "<b>{$title}:</b>\n\n{$list}<hr>";
	}
}

