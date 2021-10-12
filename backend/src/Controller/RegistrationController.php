<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Register;
use App\Form\RegistrationFormType;
use Symfony\Component\Validator\Constraints\DateTime;
use App\Security\EmailVerifier;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'register')]

    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, EntityManagerInterface $em, ValidatorInterface $validator): Response
    {
        // $user = new User();
        // $form = $this->createForm(RegistrationFormType::class, $user);
        // $form->handleRequest($request);

        // if ($form->isSubmitted() && $form->isValid()) {
        //     // encode the plain password
        //     $user->setPassword(
        //         $passwordEncoder->encodePassword(
        //             $user,
        //             $form->get('plainPassword')->getData()
        //         )
        //     );

        //     $entityManager = $this->getDoctrine()->getManager();
        //     $entityManager->persist($user);
        //     $entityManager->flush();

        //     // generate a signed url and email it to the user
        //     $this->emailVerifier->sendEmailConfirmation(
        //         'app_verify_email',
        //         $user,
        //         (new TemplatedEmail())
        //             ->from(new Address('ecommerce@ecommerce.com', 'Ecommerce Mail Bot'))
        //             ->to($user->getEmail())
        //             ->subject('Please Confirm your Email')
        //             ->htmlTemplate('registration/confirmation_email.html.twig')
        //     );
        //     // do anything else you need here, like send an email

        //     return $this->redirectToRoute('_preview_error');
        // }

        // return $this->render('registration/register.html.twig', [
        //     'registrationForm' => $form->createView(),
        // ]);
        // print_r($user);

        $register = new Register();
        $register->setFirstName($request->request->get('firstName'));
        $register->setLastName($request->request->get('lastName'));
        $register->setEmail($request->request->get('email'));
        $register->setPassword($request->request->get('password'));
        $register->setTelephone($request->request->get('tel'));
        $register->setDate(new \DateTime($request->request->get('date')));
        $register->setToken($register->getEmail() . $register->getPassword());
        $Errors = $validator->validate($register);

        if (count($Errors) > 0) return new JsonResponse(["success_message" => $Errors]);

        $user = new User();
        $user->setFirstName($register->getFirstName());
        $user->setLastName($register->getLastName());
        $user->setEmail($register->getEmail());
        $user->setPassword($passwordEncoder->encodePassword($user, $register->getPassword()));
        $user->setTelephone($register->getTelephone());
        $user->setDateDeNaissance($register->getDate());
        $user->setCreatedAt(new \DateTime(date('Y-m-d')));
        $user->setToken($passwordEncoder->encodePassword($user, $register->getToken()));
        $em->persist($user);
        $em->flush();
        return new JsonResponse(['success_message' => 'Inscription validé !']);
    }

    /**
     * @Route("/verify/email", name="app_verify_email")
     */
    // public function verifyUserEmail(Request $request): Response
    // {
    //     $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

    //     // validate email confirmation link, sets User::isVerified=true and persists
    //     try {
    //         $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
    //     } catch (VerifyEmailExceptionInterface $exception) {
    //         $this->addFlash('verify_email_error', $exception->getReason());

    //         return $this->redirectToRoute('app_register');
    //     }

    //     // @TODO Change the redirect on success and handle or remove the flash message in your templates
    //     $this->addFlash('success', 'Your email address has been verified.');

    //     return $this->redirectToRoute('app_register');
    // }
}
