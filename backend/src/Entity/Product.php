<?php

namespace App\Entity;

use App\Repository\ProductRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 */
class Product
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups("post:read")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("post:read")
     */
    private $name;

    /**
     * @ORM\Column(type="datetime")
     * @Groups("post:read")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime")
     * @Groups("post:read")
     */
    private $modifiedAt;

    /**
     * @ORM\Column(type="integer")
     * @Groups("post:read")
     */
    private $price;

    /**
     * @ORM\ManyToOne(targetEntity=ProductsCategory::class, inversedBy="products")
     * @Groups("post:read")
     */
    private $category;

    /**
     * @ORM\Column(type="text")
     * @Groups("post:read")
     */
    private $content;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("post:read")
     */
    private $image;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCreatedAt(): ?\Datetime
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\Datetime $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getModifiedAt(): ?\Datetime
    {
        return $this->modifiedAt;
    }

    public function setModifiedAt(\Datetime $modifiedAt): self
    {
        $this->modifiedAt = $modifiedAt;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getCategory(): ?ProductsCategory
    {
        return $this->category;
    }

    public function setCategory(?ProductsCategory $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }
}
