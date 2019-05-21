<?php
require('init.php');

$sql = 'SELECT 
	uData.user_id, 
	uNames.firstname,
	uNames.name,
	uNames.phone,
	uMoney.wallet,
	uMoney.bank,
	(SELECT GROUP_CONCAT(uVehs.vehicle SEPARATOR ", ") FROM vrp_user_vehicles AS uVehs WHERE uVehs.user_id = uData.user_id ) AS vehicles,
	uMain.banned,
	uData.dvalue
FROM vrp_user_data AS uData 
JOIN vrp_user_identities AS uNames ON uNames.user_id = uData.user_id
JOIN vrp_user_moneys AS uMoney ON uMoney.user_id = uData.user_id
JOIN vrp_users AS uMain ON uMain.id = uData.user_id

WHERE uData.dkey = "vRP:datatable"';

$stmt = $pdo->query($sql);
$users = $stmt->fetchAll();
//~r($users[0]);
foreach ($users as $user) {
	$data = @json_decode($user->dvalue);
	if(!$data){
		echo "Json error in user_id {$user->user_id}\n<hr>";
		continue;
	}
	echoRow('ID', $user->user_id);
	echoRow('DADOS', "{$user->firstname} {$user->name}");
	echoRow('ITENS', "<a href=\"itens.php?id={$user->user_id}\" target=\"_blank\">inventory</a>");
	echoRow('PHONE', '#'.$user->phone);
	echoRow('MONEY', "\${$user->wallet} / \${$user->bank}");
	$carsStr = (empty($user->vehicles))? '--' : $user->vehicles;
	echoRow('CARS', $carsStr);
	$groups = @array_keys((array)$data->groups);
	$groupsStr = ($groups)? implode(", ", $groups) : '--';
	echoRow('GROUPS', $groupsStr);
	if($user->banned) echo "<b>BANNED:</b> <mark>====BANNED====</mark>\n";
	echo '<hr>';
}

