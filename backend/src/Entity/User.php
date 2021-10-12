<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;


/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @ORM\Table(name="`user`")
 * @UniqueEntity(fields={"email"}, message="There is already an account with this email")
 */
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups("user")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     * @Groups("user")
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     * @Groups("user")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     * @Groups("user")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("user")
     */
    private $first_name;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("user")
     */
    private $last_name;

    /**
     * @ORM\Column(type="string", length=10)
     * @Groups("user")
     */
    private $telephone;

    /**
     * @ORM\Column(type="boolean")
     * @Groups("user")
     */
    private $isVerified = false;

    /**
     * @ORM\Column(type="datetime")
     * @Groups("user")
     */
    private $date_de_naissance;

    /**
     * @ORM\Column(type="datetime")
     * @Groups("user")
     */
    private $created_at;

    /**
     * @ORM\OneToOne(targetEntity=UserAdress::class, mappedBy="user", cascade={"persist", "remove"})
     * @Groups("user")
     */
    private $userAdress;

    /**
     * @ORM\OneToOne(targetEntity=UserPayment::class, mappedBy="user", cascade={"persist", "remove"})
     * @Groups("user")
     */
    private $userPayment;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $token;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @deprecated since Symfony 5.3, use getUserIdentifier instead
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getFirstName(): ?string
    {
        return $this->first_name;
    }

    public function setFirstName(string $first_name): self
    {
        $this->first_name = $first_name;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->last_name;
    }

    public function setLastName(string $last_name): self
    {
        $this->last_name = $last_name;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->telephone;
    }

    public function setTelephone(string $telephone): self
    {
        $this->telephone = $telephone;

        return $this;
    }

    public function isVerified(): bool
    {
        return $this->isVerified;
    }

    public function setIsVerified(bool $isVerified): self
    {
        $this->isVerified = $isVerified;

        return $this;
    }

    public function getDateDeNaissance(): ?\DateTime
    {
        return $this->date_de_naissance;
    }

    public function setDateDeNaissance(\DateTime $date_de_naissance): self
    {
        $this->date_de_naissance = $date_de_naissance;

        return $this;
    }

    public function getCreatedAt(): ?\DateTime
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTime $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUserAdress(): ?UserAdress
    {
        return $this->userAdress;
    }

    public function setUserAdress(?UserAdress $userAdress): self
    {
        // unset the owning side of the relation if necessary
        if ($userAdress === null && $this->userAdress !== null) {
            $this->userAdress->setUser(null);
        }

        // set the owning side of the relation if necessary
        if ($userAdress !== null && $userAdress->getUser() !== $this) {
            $userAdress->setUser($this);
        }

        $this->userAdress = $userAdress;

        return $this;
    }

    public function getUserPayment(): ?UserPayment
    {
        return $this->userPayment;
    }

    public function setUserPayment(?UserPayment $userPayment): self
    {
        // unset the owning side of the relation if necessary
        if ($userPayment === null && $this->userPayment !== null) {
            $this->userPayment->setUser(null);
        }

        // set the owning side of the relation if necessary
        if ($userPayment !== null && $userPayment->getUser() !== $this) {
            $userPayment->setUser($this);
        }

        $this->userPayment = $userPayment;

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