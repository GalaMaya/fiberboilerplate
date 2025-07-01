package main

import (
	"log"

	"github.com/GalaMaya/fiberboilerplate/routes"

	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	// Register routes
	routes.SetupRoutes(app)

	// Start server
	if err := app.Listen(":3000"); err != nil {
		log.Fatal(err)
	}
}
