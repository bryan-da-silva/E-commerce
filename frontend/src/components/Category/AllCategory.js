import './AllCategory.css';
import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom';
import { AiOutlineArrowRight } from 'react-icons/ai';


function AllCategory() {
    const [category, setCategory] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch(`http://${process.env.REACT_APP_DB_HOST}:${process.env.REACT_APP_PORT}/api/category/all`,
            {
                method: 'GET',
                headers: {
                    "Content-Type": "application/json"
                }
            })
            .then(res => res.json())
            .then(result => {
                setIsLoaded(true);
                setCategory(result);
                console.log(result)
            },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                    console.log(error);
                })
    }, [])


    if (error) {
        return <div>Erreur : {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Chargement...</div>;
    } else {
        return (
            <div className="container">
                <div className="wrapper_categories">
                    {category.map((cat, key) => {
                        let link = "category/" + cat.id;
                        // let url = { backgroundImage: 'url(https://i.imgur.com/D4O5MNi.png)' };
                        let url = { backgroundImage: 'url(' + cat.image + ')' }
                        return (
                            <>
                                <div className="box_categories">
                                    <div className="img_categories">
                                        <div className="title_categories">
                                            <Link to={link} replace className="link"><p>{cat.name}</p></Link>
                                        </div>
                                        <br />
                                    </div>
                                    <div className="button_categories">
                                        <AiOutlineArrowRight size={25} />
                                    </div>
                                    <div className="img_back"
                                        style={url}
                                    >
                                    </div>
                                </div>
                            </>
                        )
                        console.log(category)
                    })}
                </div>
            </div>
        )
    }
}
export default AllCategory;
