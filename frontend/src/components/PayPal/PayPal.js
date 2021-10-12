import React, {useEffect, useRef} from 'react';
import './PayPal.css';

const PayPal = () => {

    const paypal = useRef();
    useEffect(() => {
        window.paypal.Buttons({
            createOrder: (data, actions, error) => {
                return actions.order.create({
                    intent: "CAPTURE",
                    purchase_units: [
                        {
                            description: "Panier",
                            amount: {
                                currency_code: "CAD",
                                value: 1.00
                            }
                        }
                    ]
                })
            },
            onApprove: async (data, actions) => {
                const order = await actions.order.capture();
                alert("Successful Order");
                window.location.reload();
            },
            onError: (error) => {
                console.log(error);
            }
        }).render(paypal.current)
    }, []);
    return (
        <div className="container">
            <div className="wrapper_paypal">
                <div className="box_paypal" style={{height : 'fit-content'}}>
                    <div ref={paypal}></div>
                </div>
                <div className="box_paypal" style={{backgroundImage : 'url("https://i.imgur.com/WhIjSpl.png")', padding : '0px', height : '295px'}}>
                    <div className="title_paypal">à payer</div>
                    <div className="price_paypal">999.99 €</div>
                </div>
            </div>
        </div>
    )
}

export default PayPal;