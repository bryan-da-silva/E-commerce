<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\UserPayment;
use App\Repository\UserPaymentRepository;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Validator\Constraints\Json;

class ApiEditeProfileController extends AbstractController
{
    /**
     * @Route("/api/editemail", name="app_editemail", methods={"PUT"})
     */

    public function index(Request $request,UserRepository $userRepository, UserPasswordEncoderInterface $passwordEncoder, ValidatorInterface $validator, EntityManagerInterface $em
    ): JsonResponse
    {
        
        $data = json_decode($request->getContent(), true);
        $entityManager = $this->getDoctrine()->getManager();
        $user = $entityManager->getRepository(User::class);
        $user = $userRepository->findOneBy(["token" => $data['token']]);

        if (empty($data['email']))
            return new JsonResponse('Veuillez remplir le champ obligatoirement !');
        else {
            $user->setEmail($data['email']);
            $em->persist($user);
            $entityManager->flush();
            return new JsonResponse(["success_message" => "Email modifié avec success !"]);
        }
    }

    /**
     * @Route("/api/editpassword", name="app_editpassword", methods={"PUT"})
     */
    public function editPassword(Request $request, EntityManagerInterface $em, UserRepository $userRepository, UserPasswordEncoderInterface $passwordEncoder): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $entityManager = $this->getDoctrine()->getManager();
        $user = $entityManager->getRepository(User::class);
        $user = $userRepository->findOneBy(["token" => $data['token']]);
        if(empty($data['oldPassword']) || empty($data['newPassword']) || empty($data['newPasswordConfirm']))
            return new JsonResponse($data);
        else{
            if($passwordEncoder->isPasswordValid($user, $data['oldPassword']) == false)
                return new JsonResponse('Ancien mot de passe incorrect !!');
            else{
                if($data['newPassword'] != $data['newPasswordConfirm'])
                    return new JsonResponse('Les deux nouveaux mot de passe ne correspondent pas !!');
                else{
                    $user->setPassword($passwordEncoder->encodePassword($user, $data['newPassword']));
                    $em->persist($user);
                    $em->flush();
                    return new JsonResponse(['success_message' => 'Modification validé !']);
                }
            }
        }
    }

    #[Route('/api/editPayment', name: 'api_edite_payment', methods: ['PUT'])]

    public function payment(Request $request, UserPasswordEncoderInterface $passwordEncoder, UserPaymentRepository $userPaymentRepository, UserRepository $userRepository, ValidatorInterface $validator): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $entityManager = $this->getDoctrine()->getManager();

        $user = $entityManager->getRepository(User::class);
        $userPayement = $entityManager->getRepository(UserPayment::class);

        $user = $userRepository->findOneBy(["token" => $data['token']]);
        $userPayement = $userPaymentRepository->findOneBy(["user_id" => $user->getId()]);
        
        if (!$userPayement) $userPayement = new userPayment();

        $userPayement->setOwner($data["owner"]);
        $userPayement->setExpiration($data["expiration"]);
        $userPayement->setNumber($data['number']);

        $entityManager->persist($userPayement);

        $user->setUserPayment($userPayement);
        
        $errors = $validator->validate($userPayement);
        if (count($errors) > 0) return $this->json($errors, 400);

        $entityManager->persist($userPayement);
        $entityManager->flush();

        return new JsonResponse(['success_message' => 'Enregistrement réussi!']);
    }

    
}
