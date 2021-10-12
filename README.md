# ShopTech - Projet ecommerce
<h3>Création d'un site E-commerce</h3>

<h1>PREPARATION DE L'ENVIRONNEMENT</h1>

<h2>INSTALLATION SYMFONY et NPM</h2>
Si vous possédez déjà symfony et npm veuillez passez à la section suivante.

<h3>UBUNTU 20.04:</h3>
<code>sudo apt install composer</code><br><br>
<code>sudo apt install nodejs</code> => npm<br>

<h3>WINDOWS:</h3>
<span>Veuillez télécharger NodeJs <a href="https://nodejs.org/fr/download/" target="_blank">ici</a> puis installer la dernière version de nodeJS pour windows</span>

<h3>Install symfony</h3>
<span>Veuillez télécharger Symfony <a href="https://symfony.com/download" target="_blank">ici</a> puis installer la dernière version de Symfony pour votre système d'eploitation.</span><br><br>

<h2>TÉLÉCHARGEMENT DES DÉPENDENCES DU PROJET</h2>

<span>Dans le dossier <strong>frontend</strong> éxécutez <code>npm install</code></span></br></br>
<span>Cela créera un dossier <strong>node_modules</strong> et y téléchargera toute les dépendances que le projet utilise.</span><br>

<span>Dans le dossier <strong>backend</strong> éxécutez <code>composer install</code></span></br></br>
<span>Celui ci trouvera et téléchargera toute les dépendances dont le projet a besoin.</span><br><br>

<h2>.ENV</h2>
<h3>FRONTEND</h3>
<span>À la racine du dossier <strong>Frontend</strong> créé un fichier que vous devez nommer <code>.env</code></span></br>
<span>Ensuite ouvrez votre fichier et remplissez le comme ceci:</span></br><br>

REACT_APP_DB_HOST=<localhost ou l'hote sur lequel le projet est hébergé><br>
REACT_APP_PORT=<8000 ou un autre fonctionne aussi><br> 

REACT_APP_CLIENTID="le client id de votre compte paypal"

<h3>BACKEND</h3>
<span>À la racine du dossier <strong>backend</strong> chercher le fichier <code>.env</code></span><br>
<span>Ensuite ouvrez votre fichier et modifier cette ligne selon vos informations utilisateur de la bdd et de votre db :</span></br><br>
<code>DATABASE_URL="mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7"</code><br>

<span>db_user = nom utilisateur de la db</span><br>
<span>db_password = password de l'utilisateur de la db </span><br>
<span>db_name = votre base de données</span><br>

<h2>ÉXÉCUTION DU PROJET</h2>
<span>Sur votre terminal windows ou ubuntu allez à la racine de votre projet aller dans le dossier <strong>frontend</strong> et faites <code>npm run start</code></span></br>
<span>Sur votre terminal windows ou ubuntu allez à la racine de votre projet aller dans le dossier <strong>backend</strong> et faites <code>symfony server:start</code></span></br>

<h2>INFORMATIONS</h2>
<h3>Equipe du projet</h3>
<ul>
<li>Abraham Diaw</li>
<li>Bryan Da Silva</li>
<li>Antoine Geoffroy</li>
<li>Aime Koutsimouka</li>
<li>Jean françois traoré</li>
</ul>
