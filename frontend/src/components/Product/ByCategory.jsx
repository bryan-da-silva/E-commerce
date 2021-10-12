import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { Link, useHistory} from 'react-router-dom';
import "./ByCategory.css";

function ByCategory() {


    // const history = useHistory();
 
    let { id } = useParams();
    const [products, setProducts] = useState([]);
    const [category, setCategory] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch(`http://${process.env.REACT_APP_DB_HOST}:${process.env.REACT_APP_PORT}/api/category/${id}`)
            .then(res => res.json())
            .then(result => {
                setIsLoaded(true);
                setProducts(result);
            },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                })
    }, [])

    if (error) {
        return <div>Erreur : {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Chargement...</div>;
    } else if (products == 0) {
        return (
            <div className="no-products-div">
                <div className="no-products">
                    <p>Aucun produits pour le moment désolé 😢</p>
                </div>
            </div>
        )
    } else {
        return (
            <div>
                <div className="container">
                    {/**<div className="title_allproduits"><b>• Catégories :</b> <i>ordinateurs portables</i></div>**/}
                    <div className="wrapper_allproduits">
                        {products.map(product => {
                            let link ="product/" + product.id;
                            return (
                                <div className="allproduits">
                                    <img className="banner" src={product.image}/>
                                    <div className="content">
                                        <span><i>{product.name}</i></span><br/><br/>
                                        <span style={{ color: '#FF5722' }}><b>{product.price} €</b></span><br />
                                        <span><p className="desc">{product.content}</p></span><br />
                                        <button><Link to={link} className="link-product">En savoir plus</Link></button>
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                </div>
            </div>
        )
    }
}

export default ByCategory
