import React from 'react';
import './Accueil.css';

const Promo = () => {
    return (      
        <div className="promo">
            <div className="descPromos"> 
                <h1>Titre Blabla</h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas, tellus nec sodales ornare, felis turpis tincidunt velit, eget tempus ligula lorem in nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam tincidunt eget nunc vitae convallis. Nulla dapibus sodales velit, sit amet molestie dolor. Aliquam eget risus in augue porttitor sagittis ac vitae ante. Quisque pretium justo eget lectus pretium egestas.
                </p>
            </div>
            <div>
                <img
                    className="imgPromo"
                    src="assets/drive.png"
                    alt="drive"
                />
            </div>
        </div>
    )
}

const Accueil = () => {
    return(
        <div className="Accueil">
            <div className="rowAcceuil">
                <div className="allBox">
                    <div className="box BoxPcPortable">
                        <a href="http://localhost:3000/category/1"><img
                            className="pc-portable"
                            src="assets/pc-portable.png"
                            alt="pc-portable"
                        /></a>
                    </div>
                    <div className="box BoxPc">
                        <a href="http://localhost:3000/category/2"><img
                            className="pc"
                            src="assets/pc.png"
                            alt="pc"
                        /></a>
                    </div>
                    <div className="box BoxPériphériques">
                        <a href="http://localhost:3000/category/3"><img
                            className="periph"
                            src="assets/peripherique-gamer.png"
                            alt="peripherique-gamer"
                        /></a>
                    </div>
                </div>
            </div>
            <Promo />
        </div>
    )
}

export default Accueil;