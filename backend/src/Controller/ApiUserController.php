<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;


class ApiUserController extends AbstractController
{
    /** 
     * @Route("/api/user", name="api_user_index", methods={"POST"})
     */

    public function index(Request $request, UserRepository $userRepository)
    {
        $data = json_decode($request->getContent(), true);
        $entityManager = $this->getDoctrine()->getManager();
        $user = $entityManager->getRepository(User::class);

        $users = $userRepository->findOneBy(
            ["token" => $data["token"]]
        );

        return $this->json($users, Response::HTTP_OK, [], ['groups' => 'user', "userpayment"]);
    }

    /** 
     * @Route("users", name="api_user_getAll", methods={"GET"})
     */

    public function getAll(Request $request, UserRepository $userRepository, NormalizerInterface $normalizer)
    {
        $json = $request->getContent();
        $json = json_decode($json);

        $users = $userRepository->findAll();

        $usersNormalises = $normalizer->normalize($users);

        $json = json_encode($usersNormalises);

        $response = new Response($json, 200, [
            'Content-Type' => 'application/json'
        ]);
        $response->headers->set('X-Total-Count', '*');

        return $response;
    }

    /** 
     * @Route("/api/register", name="api_user_create", methods={"POST"})
     */
    public function create(Request $request, SerializerInterface $serializer, EntityManagerInterface $em)
    {
        $JsonRecu = $request->getContent();

        $post = $serializer->deserialize($JsonRecu, User::class, 'json');

        $post->setCreatedAt(new \DateTime());

        $em->persist($post);
        $em->flush();

        return $this->json($post, 201, []);
    }
}
