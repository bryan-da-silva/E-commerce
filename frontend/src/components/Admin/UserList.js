import React from 'react';
import { List, Datagrid, TextField, DateField, BooleanField, EditButton, DeleteButton } from 'react-admin';

const UserList = (props) => {
    return (
        <List {...props} >
            <Datagrid>
                <TextField source='email' />
                <TextField source='password'/>
                <TextField source='firstName' />
                <TextField source='lastName' />
                <TextField source='telephone' />
                <DateField source='dateDeNaissance' />
                <DateField source='createdAt' />
                <BooleanField source='verified' />
                <EditButton basePath='/api/register' />
                <DeleteButton basePath='/api/register' />
            </Datagrid>
        </List>
    )
}

export default UserList;