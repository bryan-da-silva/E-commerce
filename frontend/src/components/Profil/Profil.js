import React,{useState, useEffect} from 'react';
import './Profil.css';

const Profil = () => {
    const [token, setToken] = useState(null);
    const [email, setEmail] = useState("");
    const [oldPassword, SetOldPassword] = useState('');
    const [newPassword, SetNewPassword] = useState('');
    const [newPasswordConfirm, SetNewPasswordConfirm] = useState('');
    const [number, SetNumber] = useState('');
    const [expiration, SetExpiration] = useState('');
    const [owner, SetOwner] = useState('');

    let tokenUser = sessionStorage.getItem("token") || localStorage.getItem("token");
    // Affiche les informations de l'utilisateur !!
    let raw = JSON.stringify({
        "token": tokenUser
    });
    useEffect(() => {
        (async () => {
            if(!token){
                let result = await fetch(`http://localhost:8000/api/user`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": "application/json",
                    },
                    body: raw,
                });
                let infosUser = await result.json()
                setToken(infosUser)
                console.log(infosUser);
            }
        })()
    }, [token])
    
    // Modifie l'adresse email de l'utilisateur !!
    let rawEditMail = JSON.stringify({
        "token": tokenUser,
        "email": email
    });
    const editEmail = async (e) =>{
        e.preventDefault();
        if (!email) alert('Champ obligatoire !');
        let result = await fetch(`http://localhost:8000/api/editemail`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: rawEditMail,
        })
        .then((res) => res.json())
        .then(async (res) => {
            const resData = await res;
            console.log(resData);
            if (resData.success_message) alert(resData.success_message);
            window.location.reload();
        })
    }

    // modifie le mot de passe !!
    let rawEditPassword = JSON.stringify({
        "token": tokenUser,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "newPasswordConfirm": newPasswordConfirm
    });
    const editPassword = async (e) =>{
        e.preventDefault();
        if (!oldPassword || !newPassword || !newPasswordConfirm) alert('Tous les champs doivent être complétés !');
        else if(newPassword != newPasswordConfirm) alert('Les deux nouveaux mot de passe ne correspondent pas !');
        await fetch(`http://localhost:8000/api/editpassword`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: rawEditPassword,
        })
        .then((res) => res.json())
        .then(async (res) => {
            const resData = await res;
            console.log(resData);
            if (resData.success_message) alert(resData.success_message);
            window.location.reload();
        })
    }

    let rawEditPayment = JSON.stringify({
        "token": tokenUser,
        "number": number,
        "expiration": expiration,
        "owner": owner
    });
    const editPayment = async (e) =>{
        e.preventDefault();
        if (!number || !expiration || !owner) alert('Tous les champs doivent être complétés !');
        await fetch(`http://localhost:8000/api/editPayment`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: rawEditPayment,
        })
        .then((res) => res.json())
        .then(async (res) => {
            const resData = await res;
            console.log(resData);
            if (resData.success_message) alert(resData.success_message);
            window.location.reload();
        })
    }

    if(!token) return <div>Chargement...</div>
    return(
        <div className="container">
            <div className="wrapper">
                <div className="box">
                    <div className="title">
                        • Mon profil
                    </div>
                    <div className="content">
                        <span><b>Prénom :</b> {token.first_name}</span><br/>
                        <span><b>Nom :</b> {token.last_name}</span><br/>
                        <span><b>Date de naissance :</b> {token.date_de_naissance.slice(0, 10)}</span><br/>
                        <span><b>Adresse mail :</b> {token.email}</span><br/>
                        <span><b>Téléphone :</b> {token.telephone}</span>
                    </div>
                </div>
                <div className="box">
                    <div className="title">
                        • Modifier mon Email
                    </div>
                    <div className="content">
                        <form onSubmit={editEmail}>
                            <div className="oldmail"><span>{token.email}</span></div>
                            <input 
                                type="mail"
                                name="email" 
                                value={email}
                                onChange={(e) => setEmail(e.target.value)} 
                                placeholder="Nouvelle adresse mail" />
                            <input type="submit" value="modifier mon email"></input>
                        </form>
                    </div>
                </div>
                <div className="box">
                    <div className="title">
                        • Modifier mon Mot de passe
                    </div>
                    <div className="content">
                        <form onSubmit={editPassword}>
                            <input 
                                type="password"
                                value={oldPassword}
                                onChange={(e) => SetOldPassword(e.target.value)}
                                name="oldPassword" 
                                placeholder="Ancien mot de passe" 
                            />
                            <input 
                                type="password" 
                                name="newPassword"
                                value={newPassword}
                                onChange={(e) => SetNewPassword(e.target.value)}
                                placeholder="Nouveau mot de passe" />
                            <input 
                                type="password"
                                value={newPasswordConfirm}
                                onChange={(e) => SetNewPasswordConfirm(e.target.value)}
                                name="newPasswordConfirm" 
                                placeholder="Confirmez votre nouveau mot de passe" />
                            <input type="submit" value="modifier mon mot de passe"></input>
                        </form>
                    </div>
                </div>
                <div className="box">
                    <div className="title">
                        • Modifier mes informations de paiement
                    </div>
                    <div className="content">
                        <form onSubmit={editPayment}>
                            <input 
                                type="text" 
                                name="number" 
                                onChange={(e) => SetNumber(e.target.value)}
                                placeholder="Numéro de la carte" 
                                value={number}>
                            </input>
                            <input 
                                type="text" 
                                name="expiration" 
                                onChange={(e) => SetExpiration(e.target.value)}
                                placeholder="MM / JJ" 
                                value={expiration}>
                            </input>
                            <input 
                                type="text" 
                                name="owner"
                                onChange={(e) => SetOwner(e.target.value)}
                                placeholder="titulaire du compte" 
                                value={owner}>
                            </input>
                            <input type="submit" onClick={editPayment} value="modifier mes informations de paiement"></input>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Profil;