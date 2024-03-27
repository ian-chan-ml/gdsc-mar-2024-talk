package main

import (
	"fmt"
	"math/rand"
	"time"

	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// Server is Http server that exposes multiple endpoints.
type Server struct {
	rand *rand.Rand
}

// NewServer creates a server struct after initialing rand.
func NewServer() *Server {
	rd := rand.New(rand.NewSource(time.Now().Unix()))
	return &Server{
		rand: rd,
	}
}

func (s *Server) rolldice(c *gin.Context) {
	n := s.rand.Intn(6) + 1
	logger.Info("rolldice called", zap.Int("dice", n))
	c.String(200, fmt.Sprintf("%v", n))
}

var logger *zap.Logger

func main() {
	var err error
	logger, err = zap.NewDevelopment()
	if err != nil {
		fmt.Printf("error creating zap logger, error:%v", err)
		return
	}
	port := fmt.Sprintf(":%d", 8080)
	logger.Info("starting http server", zap.String("port", port))

	s := NewServer()
	r := gin.Default()
	r.GET("/rolldice", s.rolldice)

	if err := r.Run(port); err != nil {
		logger.Error("error running server", zap.Error(err))
	}
}
