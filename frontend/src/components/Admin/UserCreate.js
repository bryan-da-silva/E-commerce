import React from 'react'
import { Create, SimpleForm, Datagrid, TextInput, DateInput, BooleanInput } from 'react-admin';

const UserCreate = (props) => {
    return (
        <div>
            <Create title="Inscrit un Utilisateur" {...props} >
                <SimpleForm>
                    <TextInput  source='email' />
                    <TextInput source='password'/>
                    <TextInput source='firstName' />
                    <TextInput source='lastName' />
                    <TextInput source='telephone' />
                    <DateInput source='dateDeNaissance' />
                    <DateInput source='createdAt' />
                    <BooleanInput source='verified' />
                    <TextInput source='roles' />
                </SimpleForm>
            </Create>
        </div>
    )
}

export default UserCreate
