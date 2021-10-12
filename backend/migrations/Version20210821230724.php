<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210821230724 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE product (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL , modified_at DATETIME NOT NULL , price FLOAT NOT NULL, content LONGTEXT NOT NULL, INDEX IDX_D34A04AD12469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE products_category (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL , modified_at DATETIME NULL , PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL, telephone VARCHAR(10) NOT NULL, is_verified TINYINT(1) NOT NULL, date_de_naissance DATETIME NOT NULL, created_at DATETIME NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user ADD token VARCHAR(255) NOT NULL');
        $this->addSql('CREATE TABLE user_adress (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, adress VARCHAR(255) NOT NULL, city VARCHAR(255) NOT NULL, postal_code VARCHAR(255) NOT NULL, country VARCHAR(255) NOT NULL, telephone INT DEFAULT NULL, UNIQUE INDEX UNIQ_39BEDC83A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_payment (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, payment_type VARCHAR(255) NOT NULL, payment TINYINT(1) NOT NULL, account_no VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_35259A07A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_payment ADD owner VARCHAR(255) NOT NULL, ADD expiration VARCHAR(255) NOT NULL, ADD number VARCHAR(255) NOT NULL, DROP payment_type, DROP payment, DROP account_no');
        $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES products_category (id)');
        $this->addSql('ALTER TABLE user_adress ADD CONSTRAINT FK_39BEDC83A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE user_payment ADD CONSTRAINT FK_35259A07A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD12469DE2');
        $this->addSql('ALTER TABLE product DROP image, CHANGE price price DOUBLE PRECISION NOT NULL');
        $this->addSql('ALTER TABLE user_adress DROP FOREIGN KEY FK_39BEDC83A76ED395');
        $this->addSql('ALTER TABLE user_payment DROP FOREIGN KEY FK_35259A07A76ED395');
        $this->addSql('ALTER TABLE user DROP token');
        $this->addSql('ALTER TABLE products_category CHANGE modified_at modified_at DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE user_payment ADD payment_type VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, ADD payment TINYINT(1) NOT NULL, ADD account_no VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, DROP owner, DROP expiration, DROP number');
        $this->addSql('DROP TABLE product');
        $this->addSql('DROP TABLE products_category');
        $this->addSql('DROP TABLE `user`');
        $this->addSql('DROP TABLE user_adress');
        $this->addSql('DROP TABLE user_payment');
    }
}
