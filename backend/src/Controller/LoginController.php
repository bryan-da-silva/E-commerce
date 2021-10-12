<?php

namespace App\Controller;

use App\Repository\UserRepository;
use App\Entity\User;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RequestStack;
// use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends AbstractController
{
    /**
     * @Route("/api/login", name="app_login", methods={"POST"})
     */
    public function login(Request $request, UserRepository $userRepository, NormalizerInterface $normalizer, UserPasswordEncoderInterface $passwordEncoder, RequestStack $requestStack): JsonResponse
    {
        // $json = $request->getContent();
        // $hey = json_decode($json);
        // $user = $userRepository->findOneBy(
        //     ["email" => $hey->email]
        // );
        // // $usersNormalises = $normalizer->normalize($user);

        // if(!$user || $passwordEncoder->isPasswordValid($user, $hey->password) == false) {
        //     $erreur = new JsonResponse(["code" => "false"]);
        //     return $erreur;
        // }
        // else {
        //     // $json = json_encode($usersNormalises);
        //     // dd($user);
        //     return new JsonResponse($json);
            
        // }

        $data = $request->getContent();
        $jsonDecode = json_decode($data);
        $findUser = $userRepository->findOneBy(
            ["email" => $jsonDecode->email]
        );

        // dd($findUser);
        if(!$findUser || $passwordEncoder->isPasswordValid($findUser, $jsonDecode->password) == false) 
            return new JsonResponse(["message" => "Email ou Mot de passe incorrecte"]);
        else
            return new JsonResponse([
                "email" => $findUser->getEmail(),
                "roles" => $findUser->getRoles(),
                "token" => $findUser->getToken(),
            ]);
    }

    /**
     * @Route("/logout", name="app_logout")
     */
    public function logout()
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}