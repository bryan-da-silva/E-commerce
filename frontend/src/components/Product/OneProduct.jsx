import './OneProduct.css';
import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
function OneProduct() {

    let { id } = useParams();
    const [product, setProduct] = useState([]);
    const [category, setCategory] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch(`http://${process.env.REACT_APP_DB_HOST}:${process.env.REACT_APP_PORT}/api/product/${id}`)
            .then(res => res.json())
            .then(result => {
                setIsLoaded(true);
                setProduct(result);
                setCategory(result.category);
            },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                })
    }, [])
    console.log(product)

    if (error) {
        return <div>Erreur : {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Chargement...</div>;
    } else {
        return (
            <div className="container">
            <div className="wrapper_produits">
                    <img className="produits" src={ product.image }/>
                <div className="affichage">
                    <div className="name_produits">{ product.name }</div>
                    <div className="available">En stock</div> { /* ou Indisponible */ }
                    <div className="description">
                        <span>
                            <b>Description :</b> { product.content } 
                        </span>
                    </div>
                    <div className="prix">
                        <span>
                            { product.price }€
                        </span>
                    </div>
                    <form>
                        <input type="number" name="" placeholder="Quantitée" style={{width:'35%'}}></input><br/>
                        <input type="submit" name="" value="ajouter au panier" style={{width:'100%', background: '#E91E63'}}></input>
                        <input type="submit" name="" value="acheter le produit" style={{width:'100%', background: '#FF5722'}}></input>
                    </form>
                </div>
            </div>
        </div>
        )
    }
}

export default OneProduct
