import React from 'react';
import './Nav.css';
import { AiOutlineHeart } from 'react-icons/ai';
import { IoCartOutline } from 'react-icons/io5';
import { NavLink } from 'react-router-dom';

const Nav = () => {
    return (
        <div className="containerNav">
            <div className="auth">
                <div className="containertest">
                    <ul className="listAuth">
                        <NavLink to="/login">
                            <li>Connexion</li>
                        </NavLink>
                        <NavLink to="/register">
                            <li>Inscription</li>
                        </NavLink>
                    </ul>
                </div>
            </div>
            <div className="middleNav">
                <div className="rowMiddleNav">
                    <h1>ShopTech</h1>
                    <input
                        type="text"
                        className="searchBar"
                        placeholder="Search..."
                    />
                    <div className="list">
                        {/* <div className="buyList">
                            <span className="hearth">
                                <AiOutlineHeart size={21} />
                            </span>
                            <p>Liste d'achat</p>
                        </div> */}
                        <div className="buy">
                            <span className="cart">
                                <IoCartOutline size={21} />
                            </span>
                            <p>Panier</p>
                        </div>
                    </div>
                </div>
            </div>
            <div className="navLink">
            <div className="containertest">
                <ul>
                    <NavLink to="/">
                        <li>Accueil</li>
                    </NavLink>
                    <NavLink to="/category/1">
                        <li>Ordinateurs Portable</li>
                    </NavLink>
                    <NavLink to="/category">
                        <li>Catégories</li>
                    </NavLink>
                    <NavLink to="/category/2">
                        <li>Ordinateurs Fixe</li>
                    </NavLink>
                    <NavLink to="/category/3">
                        <li>Périphériques</li>
                    </NavLink>
                </ul>
                </div>
            </div>
        </div>
    )
}

export default Nav;