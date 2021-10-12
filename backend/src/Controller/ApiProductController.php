<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\ProductCategory;
use Doctrine\ORM\EntityManager;
use App\Entity\ProductsCategory;
use Doctrine\ORM\Query\Parameter;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\ProductsCategoryRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;

class ApiProductController extends AbstractController
{

    #[Route('/api/product', name: 'api_product_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository)
    {
        return $this->json($productRepository->findAll(), 200, [], ['groups' => 'post:read']);
    }

    #[Route("/api/product/{id}", name: 'api_product_findByProduct', methods: ['GET'])]
    public function findByProduct(int $id, ProductRepository $productRepository)
    {
        return $this->json($productRepository->find($id), 200, [], ['groups' => 'post:read']);
    }

    #[Route('/api/product/create', name: 'api_product_createProduct', methods: ['POST'])]
    public function createProduct(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        ValidatorInterface $validator,
        ProductsCategoryRepository $category
    ) {
        $json = $request->getContent();
        $cat = $category->findBy(["id" => 1])[0];
        $test = json_decode($json);
        $cat = $category->findBy(["id" => $test->category])[0];

        try {
            $product = $serializer->deserialize($json, Product::class, 'json');
            $product->setCreatedAt(new \Datetime());
            $product->setModifiedAt(new \Datetime());
            $product->setCategory($cat);
            $errors = $validator->validate($product);
            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }
            $em->persist($product);
            $em->flush();
            return $this->json($product, 201, [], ['groups' => 'post:read']);
        } catch (NotEncodableValueException $e) {
            return $this->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function updateProduct(Product $product): Product
    {
        dump($product);
        $this->manager->persist($product);
        $this->manager->flush();

        return $product;
    }

    #[Route('/api/product/edit/{id}', name: 'api_product_editProduct', methods: ['PUT'])]
    public function editProduct(
        $id,
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        ValidatorInterface $validator,
        ProductRepository $productRepository
    ) {
        $product = $this->getDoctrine()->getRepository(Product::class);
        $product = $productRepository->findOneBy(['id' => $id]);

        $data = json_decode($request->getContent(), true);

        dump($data);
        dump($product);

        empty($data['name']) ? true : $product->setName($data['name']);
        empty($data['price']) ? true : $product->setPrice($data['price']);
        // empty($data['category']) ? true : $product->setCategory($data['category']);
        empty($data['content']) ? true : $product->setContent($data['content']);

        dump($product);

        // $updatedCostumer = $productRepository->updateProduct($product);
        $product->manager->persist($product);
        $product->manager->flush();
        return $product;

        // dump($updatedCostumer);
        // return new JsonResponse($updatedCostumer->toArray(), Response::HTTP_OK);
    }

    #[Route('/api/category/all', name: 'api_product_index', methods: ['GET'])]
    public function allCategory(ProductsCategoryRepository $categoryRepository)
    {
        return $this->json($categoryRepository->findAll(), 200, [], ['groups' => 'post:read']);
    }

    #[Route('/api/category/{id}', name: 'api_category_findByCategory', methods: ['GET'])]
    public function findByCategory(Request $request, ProductRepository $productRepository, int $id)
    {
        return $this->json(
            $productRepository->findBy(["category" => $id]),
            200,
            [],
            ['groups' => 'post:read']
        );
    }

    #[Route('/api/category/create', name: 'api_category_createCategory', methods: ['POST'])]
    public function createCategory(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        ValidatorInterface $validator,
        ProductsCategoryRepository $category
    ) {
        $json = $request->getContent();
        $test = json_decode($json);

        try {
            $cat = new ProductsCategory();
            $cat->setName($test->name);
            $cat->setImage($test->image);
            $cat->setCreatedAt(new \Datetime());
            $cat->setModifiedAt(new \Datetime());

            $errors = $validator->validate($category);
            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }

            $em->persist($cat);
            $em->flush();
            return $this->json($cat, 201, [], ['groups' => 'post:read']);
        } catch (NotEncodableValueException $e) {
            return $this->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        }
    }
}
