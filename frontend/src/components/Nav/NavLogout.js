import React from 'react';
import './Nav.css';
import { AiOutlineHeart } from 'react-icons/ai';
import { IoCartOutline } from 'react-icons/io5';
import { CgProfile } from 'react-icons/cg';
import { Link, NavLink } from 'react-router-dom';
import { useHistory } from 'react-router';

const NavLogout = () => {
    const Logout = () => {
        
        if (localStorage.getItem('token')) {
            localStorage.clear();
            history.push("/");
            window.location.reload();
        }
        if (sessionStorage.getItem('token')) {
            sessionStorage.clear();
            history.push("/");
            window.location.reload();
        }
    }
    const history = useHistory();
    return (
        <div className="containerNav">
        <div className="auth">
                <div className="containertest">
                    <ul className="listAuth">
                        <NavLink to="#" onClick={Logout}>
                            <li>Déconnexion</li>
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
                        <div className="buyList">
                            <span className="hearth">
                                <AiOutlineHeart size={31} />
                            </span>
                        </div>
                        <div className="buy">
                            <span className="cart">
                                <IoCartOutline size={31} />
                            </span>
                        </div>
                        <div className="profile">
                            <NavLink to='/profile'>
                                <span className="profile-icon">
                                    <CgProfile size={31} />
                                </span>
                            </NavLink>
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
                    <Link to="/category/1">
                        <li>Ordinateurs Portable</li>
                    </Link>
                    <Link to="/category">
                        <li>Catégories</li>
                    </Link>
                    <Link to="/category/2">
                        <li>Ordinateurs Fixe</li>
                    </Link>
                    <Link to="/category/3">
                        <li>Périphériques</li>
                    </Link>
                </ul>
                </div>
            </div>
        </div>
    )
}

export default NavLogout;
