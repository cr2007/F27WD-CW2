<?php

include "pdo.php";

if (isset($_POST["user_name"])){
  $selected_user_name = $_POST["user_name"];
}else{
  $selected_user_name = "";
}

//Initial HTML Code
echo "<html><body>";
echo "<form action='user.php' method='post'>";
echo "<select name='user_name'>";

$result = $pdo->query("SELECT DISTINCT userName FROM userVisits ORDER BY userName");

while ($row = $result->fetch()) {
  $name = $row["userName"];
  if ($name == $selected_user_name) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $name . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_user_name) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>User Name</th><th align='left'>Site</th><th align='left'>Rating</th></tr>";
 
  $stmt = $pdo->prepare("SELECT userName, siteName, rating FROM userVisits WHERE userName = ? ORDER BY rating DESC");
  $stmt->execute([$selected_user_name]);

    while ($row = $stmt->fetch()){
        echo "<tr><td>" . $row["userName"] . "</td><td>" . $row["siteName"] . "</td><td>" . $row["rating"] . "</td></tr>";
    }
}

echo "</table>";
echo "</body></html>"

?>