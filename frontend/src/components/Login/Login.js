import React, { useState } from 'react';
import {IoMailSharp} from 'react-icons/io5';
import {AiFillLock} from 'react-icons/ai';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons';

import './Login.css';
import { NavLink, useHistory} from 'react-router-dom';
const Login = () => {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [checkbox, setCheckbox] = useState(false);
    const [showPassword, setShowPassword] = useState(true);

    const ShowPassword = () => {
        showPassword ? setShowPassword(false) : setShowPassword(true)
    }
    
    let raw = JSON.stringify({
        "email": email,
        "password": password
    });
    
    const onSubmit = async () => {
        if (!email && !password) return false;
        let result = await fetch(`http://localhost:8000/api/login`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: raw,
        });
        await result.json()
        .then(reponse => {
            // console.log(reponse);
            if (reponse.message) alert(reponse.message);
            else {
                // alert("Connexion réussi !");
                if(!checkbox) {
                    sessionStorage.setItem("token", reponse.token);
                    sessionStorage.setItem("roles", reponse.roles);
                }
                else if(checkbox) {
                    localStorage.setItem('token', reponse.token)
                    localStorage.setItem('roles', reponse.roles)
                }
                history.push("/");
                window.location.reload();
            }
        }).catch(reponse => {alert(reponse);})
    };
    const history = useHistory();
    return (
        <div className="containertest">
            <div className="Login">
                <div className="Login-container">
                    <div className="rowLogin">
                        <div className="form-login">
                            <ul className="choiceAuth">
                                <NavLink to="/login">
                                    <li id="listLoginLog">Je m'identifie</li>
                                </NavLink>
                                <NavLink to="/register">
                                    <li id="listRegisterLog">Je creer un compte</li>
                                </NavLink>
                            </ul>
                        </div>
                        <div className="login-content">
                            <div className="login-input">
                                <div className="input">
                                    <div className='label'>
                                        <label>Adresse email</label>
                                    </div>
                                    <div className="content-input">
                                        <span className="icon">
                                            <IoMailSharp/>
                                        </span>
                                        <input
                                            type="text"
                                            value={email}
                                            onChange={(e) => setEmail(e.target.value)}
                                            placeholder="Adresse email"
                                        />
                                    </div>
                                </div>
                                <div className="input">
                                    <div className='label'>
                                        <label>Mot de passe</label>
                                    </div>
                                    <div className="content-input">
                                        <span className="icon">
                                            <AiFillLock />
                                        </span>
                                        <input
                                            type={showPassword ? "password" : "text"}
                                            value={password}
                                            onChange={(e) => setPassword(e.target.value)}
                                            placeholder="Mot de passe"
                                        />
                                        <span className="password-toogle-icon">
                                            <div>
                                                <FontAwesomeIcon icon={showPassword ? faEyeSlash : faEye} onClick={ShowPassword}/>
                                            </div>
                                        </span>
                                    </div>
                                    <p className="mdp-forget">Mot de passe oublié ?</p>
                                </div>
                            </div>
                            <div className="input-checkbox">
                            <label>
                                    <input 
                                        type="checkbox" 
                                        id="scales" 
                                        name="scales"
                                        value={checkbox}
                                        onChange={(e) => setCheckbox(e.target.value)}
                                    />
                                    Cocher pour se souvenir de moi
                                </label>
                            </div>
                            <div className="input-button">
                                <button onClick={onSubmit}>SE CONNECTER</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Login;