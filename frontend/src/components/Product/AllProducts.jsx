import React, { useState, useEffect } from 'react'

function OneProduct() {

    const [products, setProducts] = useState([]);
    const [category, setCategory] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch(`http://${process.env.REACT_APP_DB_HOST}:${process.env.REACT_APP_PORT}/api/product`)
            .then(res => res.json())
            .then(result => {
                setIsLoaded(true);
                setProducts(result);
                console.log(result)
                setCategory(result.category);
            },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                })
    }, [])
    console.log(category)
    if (error) {
        return <div>Erreur : {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Chargement...</div>;
    } else {
        return (
            <div>
                <h1>All products</h1>
                <ul>
                    {products.map(item => (
                        <div>
                            <h4>Name : {item.name}</h4>
                            <p>{item.price}$</p>
                            {/* <p>Category : {category.name}</p> */}
                        </div>
                    ))}
                </ul>
            </div>
        )
    }
}

export default OneProduct
