import React from 'react';
import "./Footer.css";
import { GiPositionMarker } from 'react-icons/gi';
import { FaPhoneAlt } from 'react-icons/fa';
import { MdMail } from 'react-icons/md';
import { RiFacebookFill } from 'react-icons/ri';
import { AiOutlineTwitter, AiFillInstagram } from 'react-icons/ai';
import { ImLinkedin2 } from 'react-icons/im';


const Footer = () => {
    return (
        <div className="Footer">
            <div className="rowFooter">
                <div className="info">
                    <div className="info1">
                        <ul>
                            <div className="infoVille"> 
                                <span><GiPositionMarker size={35}/></span>
                                <li>75000, Paris, France</li>
                            </div>
                            <div className="infoNum"> 
                                <span><FaPhoneAlt size={30} /></span>
                                <li>01.35.75.95.42</li>
                            </div>
                            <div className="infoMail"> 
                                <span><MdMail size={35} /></span>
                                <li>contact@e-commerce.com</li>
                            </div>
                        </ul>
                    </div>
                    <div className="legal">
                        <h1>Titre blabla</h1>
                        <p>Donec elementum lorem ipsum, ac bibendum mauris imperdiet a. Donec convallis mollis efficitur. In eget congue nunc. Duis nunc felis, interdum sit amet sem et, mollis euismod nisi. Nunc et augue non enim pharetra sollicitudin.</p>
                        <ul>
                            <div id="facebook">
                                <span><RiFacebookFill size={35} /></span>
                            </div>
                            <div id="twitter">
                                <span><AiOutlineTwitter size={35} /></span>
                            </div>
                            <div id="linkedin">
                                <span><AiFillInstagram size={35} /></span>
                            </div>
                            <div id="instagram">
                                <span><ImLinkedin2 size={30} /></span>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Footer;