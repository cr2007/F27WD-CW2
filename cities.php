<?php

include "pdo.php";
 
if (isset($_POST["city_name"])){
  $selected_city_name = $_POST["city_name"];
}else{
  $selected_city_name = "";
}

echo "<html><body>";
echo "<form action='cities.php' method='post'>";
echo "<select name='city_name'>";

$result = $pdo->query("SELECT DISTINCT cityName FROM cities ORDER BY cityName");

while ($row = $result->fetch()) {
  $type = $row["cityName"];
  if ($type == $selected_city_name) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_city_name) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>Average Rating</th><th align='left'>Site Name</th></tr>";

  $stmt = $pdo->prepare("SELECT DISTINCT avg(rating), uservisits.siteName FROM userVisits RIGHT JOIN sites ON uservisits.siteName = sites.siteName WHERE sites.cityName = ? GROUP BY uservisits.siteName ORDER BY uservisits.siteName");
  $stmt->execute([$selected_city_name]);

  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["avg(rating)"] . "</td><td>" . $row["siteName"] . "</td></tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>