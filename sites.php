<?php

include "pdo.php";

if (isset($_POST["site_type"])){
  $selected_site_type = $_POST["site_type"];
}else{
  $selected_site_type = "";
}

echo "<html><body>";
echo "<form action='sites.php' method='post'>";
echo "<select name='site_type'>";

$result = $pdo->query("SELECT DISTINCT siteCategory FROM sites ORDER BY siteCategory");

while ($row = $result->fetch()) {
  $type = $row["siteCategory"];
  if ($type == $selected_site_type) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_site_type) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>Site Name</th><th align='left'>City</th><th align='left'>Country</th><th align='left'>Visa Requirement</th></tr>";

  //Changing the query to get the country name and the visa requierment
  $stmt = $pdo->prepare("SELECT DISTINCT sites.siteName, sites.cityName, cities.country, countries.visa FROM sites, cities, countries WHERE siteCategory = ? AND sites.cityName = cities.cityName AND countries.country = cities.country
  ");
  $stmt->execute([$selected_site_type]);
 
  //Adding columns in the table to store the data for country and visa
  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["siteName"] . "</td><td>" . $row["cityName"] . "</td><td>" . $row["country"] . "</td><td>" . $row["visa"] . "</td></tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>