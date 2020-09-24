<?php
session_start();
?>
<html>

<head>
	<title>Lecture d'un sujet</title>
	<link href="../forum.css" rel="stylesheet">
	<meta charset="UTF-8">
</head>

<body class="lire_sujet">

<header>
	<ul>
<?php


	if(isset($_POST['deco']))
	{
	unset($_SESSION['login']);
	unset($_SESSION['password']);		
	}
		
	if(isset($_SESSION['login']))
	{
?>	
	<li><a href="../../index.php">Accueil</a></li>
	<div class="deco">
	<form  method="post">
		<input type="submit" name="deco" value="Déconnexion">
	</form>
	</div>
<?php		
	}	
?>
	</ul>			
</header>

<?php
if(isset($_SESSION['login']))
{
	$base = mysqli_connect("localhost", "root", "", "forum");
	mysqli_set_charset($base, "utf8");
	$titre=$_SESSION['topic'];
	
	$categorie = "SELECT id_categorie FROM sous_categorie  WHERE titre ='$titre'";
	$result=mysqli_query($base, $categorie);
	$numcategorie=mysqli_fetch_array($result);
	
	$topic = "SELECT id FROM sous_categorie WHERE titre='$titre'";
	$result=mysqli_query($base, $topic);
	$numtopic=mysqli_fetch_array($result);
			
	$_GET['categorie'] = $numcategorie['id_categorie'];
	$_GET['topic'] = $numtopic['id'];
	

	



if(isset($_POST['go']))
{
		

		$auteur = $_SESSION['login'];
		$titre = addslashes($_POST['titre']);
		$message= addslashes($_POST['message']);
		

		$requete2="SELECT titre from forum_sujets where titre='$titre'";
		$resultatrequete2=mysqli_query($base, $requete2);
		$correspondance=mysqli_num_rows($resultatrequete2);
		
		if($correspondance > 0)
		{
		 echo "titre déjà existant";		
		}
		else
		{

		$sql = "INSERT INTO `forum_sujets` (`auteur`, `date_derniere_reponse`, `titre`, `correspondance_categorie`, `topic`)  VALUES ('".$auteur."', CURRENT_TIMESTAMP(), '".$titre."','".$_POST['categorie']."','".$_POST['topic']."')";
		
		

		mysqli_query($base, $sql) or die('Erreur SQL !'.$sql.'<br />'.mysqli_error($base));

		

        $requete="SELECT id from forum_sujets WHERE auteur= '$auteur' and titre= '$titre'";
		$result=mysqli_query($base, $requete);
		$row = mysqli_fetch_array($result);	
	    $id_sujet= $row['id'];
		
	
		$sql = "INSERT INTO `forum_reponses` (`auteur`, `message`, `date_reponse`, `correspondance_sujet`) VALUES ('".$auteur."', '".$message."', CURRENT_TIMESTAMP(), '".$id_sujet."')";

		mysqli_query($base,$sql) or die('Erreur SQL !'.$sql.'<br />'.mysqli_error($base));

		mysqli_close($base);

	
		$caracteres="/?categorie=";
		$categorie=$_GET['categorie'];
		$pages=$caracteres."".$categorie;
		$_SESSION['sujet']=$_POST['titre'];
	
		header('Location: ../forum.php'.$pages);

		exit;
		}
}
?>


<body class="insert_sujet">


<section class="formsujet2">
	<div class="form-style-8">
	<form class="insertionsujet" method="post">
		<input type="text" disabled="disabled" name="auteur" value="<?php echo $_SESSION['login']; ?>">
		<input  required placeholder="Titre" type="text" name="titre" size="50">
		<textarea required placeholder="Votre message" name="message"></textarea>
		<input type="hidden" name="categorie" value="<?php echo $_GET['categorie']?>">
		<input type="hidden" name="topic" value="<?php echo $_GET['topic'];?>">
		<input type="submit" name="go" value="Poster">
	</form>
	</div>
</section>

<?php
}
else
{
	header('location: ../connexion.php');
}
?>
</body>
</html>