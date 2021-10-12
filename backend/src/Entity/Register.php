<?php

namespace App\Entity;

use App\Repository\RegisterRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

class Register
{

    /**
     * @Assert\NotBlank(message="Une adresse mail est requise")
     * @Assert\Email(
     *     message="L'adresse mail est invalide"
     * )
     */
    protected $email;

    /**
     * @Assert\NotBlank(message="Prenom requis")
     * @Assert\Length(
     *     min = 3,
     *     minMessage="Le prenom doit contenir au moins 3 caractère minimum",
     *     max = 255,
     *     maxMessage="Le prenom ne peut contenir que 255 caractères maximum"
     * )
     * @Assert\Regex(
     *     pattern="/^[a-zA-Z ]*$/",
     *     message="Le prenom ne doit contenir que des lettres"
     * )
     */
    protected $firstName;

    /**
     * @Assert\NotBlank(message="Nom requis")
     * @Assert\Length(
     *     min = 3,
     *     minMessage="Le nom doit contenir au moins 3 caractère minimum",
     *     max = 255,
     *     maxMessage="Le nom ne peut contenir que 255 caractères maximum"
     * )
     * @Assert\Regex(
     *     pattern="/^[a-zA-Z ]*$/",
     *     message="Le nom ne doit contenir que des lettres"
     * )
     */
    protected $lastName;

    /**
     * @Assert\NotBlank(message="Numéro de téléphone requis")
     */
    protected $tel;

    /**
     * @Assert\NotBlank(message="Un mot de passe est requis")
     * @Assert\Length(
     *     min = 6,
     *     minMessage="Le mot de passe doit contenir au moins 6 caractère minimum",
     *     max = 255,
     *     maxMessage="Le mot de passe ne peut contenir que 255 caractères maximum"
     * )
     */
    protected $password;

    protected $date_de_naissance;

    protected $token;

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->tel;
    }

    public function setTelephone(string $tel): self
    {
        $this->tel = $tel;

        return $this;
    }

    public function getDate(): ?\DateTime
    {
        return $this->date_de_naissance;
    }

    public function setDate(\DateTime $date_de_naissance): self
    {
        $this->date_de_naissance = $date_de_naissance;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(string $token): self
    {
        $this->token = $token;

        return $this;
    }
}
