import './App.css';
import React, {useState, useEffect, createContext}from 'react';
import { RouteNotFound, Nav, NavLogout, Accueil, Footer, Register, Login, AllCategory, Profil, OneProduct, ByCategory,Payment, UserList, UserCreate } from './components'
import { Route, Switch } from "react-router-dom";
import {fetchUtils, Admin, Resource, ListGuesser } from 'react-admin';
import simpleRestProvider from 'ra-data-simple-rest';
import jsonServerProvider from 'ra-data-json-server';

function App() {
  //https://jsonplaceholder.typicode.com
  //http://localhost:8000/
  
  const dataProvider = jsonServerProvider('http://localhost:8000');

  const [token, setToken] = useState(null);
  const [roles, setRole] = useState("");
  // console.log(useLocation());
  
  (async () => {
    try {
      let token = await localStorage.getItem("token") || sessionStorage.getItem("token");
      setToken(token);
      let roles = await localStorage.getItem("roles") || sessionStorage.getItem("roles");
      setRole(roles);
    } catch (e) {
      console.log(e)
    }
  })()
  // console.log(token)
  // if (roles == "ROLE_USER") {
    //   console.log("Mon user");
    // }
    
  if (roles === "ROLE_ADMIN") {
    return (
      <Admin dataProvider={dataProvider}>
        <Resource name="users" list={UserList} create={UserCreate} edit/>
    </Admin>
    )
  }
  return (
      <div className="App">
        {/* {
          !token ? (
            <>
              <Nav />
              <Switch>
                <Route path="/register" exact
                  component={Register}
                />
                <Route path="/login" exact
                  component={Login}
                />
              </Switch>
            </>
          ) : (
            <>
              <NavLogout />
              <Route path="/profile" exact
                component={Profil}
              />
            </>
          )
      }

            <Switch>
              <Route path="/" exact
              component={Accueil}
              />
              <Route path="/category" exact
                component={AllCategory}
              />
              <Route path="/category/:id" exact
                component={ByCategory}
              />
              <Route path="/category/product/:id" exact
                component={OneProduct}
              />
              <Route path="/payment" exact
                component={Payment}
              />
              <Route path="*">
                <RouteNotFound />
              </Route>
            </Switch> */}

            {
              !token ? (
                <>
                  <Nav />
                  <Switch>
                    <Route path="/" exact
                      component={Accueil}
                    />
                    <Route path="/register" exact
                      component={Register}
                    />
                    <Route path="/login" exact
                      component={Login}
                    />
                    <Route path="/category" exact
                      component={AllCategory}
                    />
                    <Route path="/category/:id" exact
                      component={ByCategory}
                    />
                    <Route path="/category/product/:id" exact
                      component={OneProduct}
                    />
                    <Route path="/payment" exact
                      component={Payment}
                    />
                    <Route path="*">
                      <RouteNotFound />
                    </Route>
                  </Switch>
                </>
              ) : (
                <>
                <NavLogout />
                  <Switch>
                    <Route path="/" exact
                      component={Accueil}
                    />
                    <Route path="/register" exact
                      component={Register}
                    />
                    <Route path="/login" exact
                      component={Login}
                    />
                    <Route path="/category" exact
                      component={AllCategory}
                    />
                    <Route path="/category/:id" exact
                      component={ByCategory}
                    />
                    <Route path="/category/product/:id" exact
                      component={OneProduct}
                    />
                    <Route path="/payment" exact
                      component={Payment}
                    />
                    <Route path="/profile" exact
                      component={Profil}
                    />
                    <Route path="*">
                      <RouteNotFound />
                    </Route>
                  </Switch>
                </>
              )
            }
            <Footer />
      </div>
  );
}

export default App;