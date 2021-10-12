import React from 'react';
import './Register.css';
import { NavLink} from 'react-router-dom';
import { AiOutlineHeart } from 'react-icons/ai';
import { useState, useEffect } from 'react';

const Register = () => {

    const [register, setRegister] = useState({
        email: "",
        password: "",
        firstName: "",
        lastName: "",
        tel: "",
        date: ""
    });

    let formdata = new FormData();
    formdata.append("firstName", register.firstName);
    formdata.append("lastName", register.lastName);
    formdata.append("email", register.email);
    formdata.append("password", register.password);
    formdata.append("tel", register.tel);
    formdata.append("date", register.date);

    const submitRequest = async (e) => {
        e.preventDefault();
        if (!register.email || !register.password || !register.firstName || !register.lastName || !register.tel || !register.date) return false;
        await fetch(`http://${process.env.REACT_APP_DB_HOST}:${process.env.REACT_APP_PORT}/register`, { 
            method: 'POST', 
            body: formdata
        }).then((res) => res.json())
        .then(async (res) => {
                const resData = await res;
                console.log(resData);
                if (resData.success_message) alert(resData.success_message);
                else alert("L'inscription à échoué");
        })
        .then(() => {
            setRegister({
                email: "",
                password: "",
                firstName: "",
                lastName: "",
                tel: "",
                date: ""
            });
        });
    }

    function handleStateChange(e) {
        setRegister((prevState) => ({
          ...prevState,
          [e.target.name]: e.target.value,
        }));
    }
    
    return (
        <div className="containertest">
            <div className="register">
                <div className="rowRegister">
                    <div className="allForm">
                        <div className="formHead">
                            <div>
                                <ul className="choiceAuth">
                                    <NavLink to="/login">
                                        <li id="listLogin">Je m'identifie</li>
                                    </NavLink>
                                    <NavLink to="/register">
                                        <li id="listRegister">Je creer un compte</li>
                                    </NavLink>
                                </ul>
                            </div>
                        </div>
                        <div className="formRegister">
                            <form onSubmit={submitRequest}>
                                <div className="label_mail">Adresse mail</div>
                                <label>
                                        <input 
                                            type="email" 
                                            name="email" 
                                            placeholder="Adresse mail"
                                            required value={register.email} 
                                            onChange={handleStateChange}
                                        />
                                </label>
                                <div className="label_infos">Mes informations</div>
                                <div className="wrapper_input">
                                    <label>
                                            <input 
                                                type="text" 
                                                name="firstName" 
                                                placeholder="Prénom"  
                                                required 
                                                value={register.firstName} 
                                                onChange={handleStateChange}
                                            />
                                        </label>
                                        <label>
                                            <input 
                                                type="text" 
                                                name="lastName" 
                                                placeholder="Nom de famille"  
                                                required 
                                                value={register.lastName} 
                                                onChange={handleStateChange}
                                            />
                                    </label>
                                    <label>
                                        <input 
                                            type="tel" 
                                            name="tel" 
                                            placeholder="Téléphone"  
                                            required 
                                            value={register.tel} 
                                            onChange={handleStateChange}
                                        />
                                    </label>
                                    <label>
                                        <input 
                                            type="date" 
                                            name="date" 
                                            placeholder="date de naissance"  
                                            required 
                                            value={register.date} 
                                            onChange={handleStateChange}
                                        />
                                    </label>
                                </div>
                                <div className="label_infos">Mot de passe</div>
                                <div className="wrapper_input">
                                    <label>
                                        <input 
                                        type="password" 
                                        name="password"
                                        placeholder="Mot de passe"  
                                        required 
                                        value={register.password} 
                                        onChange={handleStateChange}
                                        />
                                    </label>
                                    <label>
                                        <input 
                                        type="password" 
                                        name="password"
                                        placeholder="Confirmez votre mot de passe"  
                                        required 
                                        value={register.password} 
                                        onChange={handleStateChange}
                                        />
                                    </label>
                                </div>
                                <input type="submit" name="" value="je cree mon compte"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Register;