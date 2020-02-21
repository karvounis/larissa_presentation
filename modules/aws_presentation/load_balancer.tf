resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0
  name  = "larissadevslb"

  internal = false

  subnets = var.vpc_subnet_ids

  security_groups = var.lb_security_group_ids
}

resource "aws_lb_target_group" "this" {
  count = var.create_lb ? 1 : 0

  vpc_id   = var.vpc_id
  name     = "tg"
  port     = 80
  protocol = "HTTP"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 6
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 4
  }
}

resource "aws_lb_listener" "this" {
  count = var.create_lb ? 1 : 0

  load_balancer_arn = aws_lb.this[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[0].arn
  }
}

resource "aws_alb_target_group_attachment" "larissa_dev_target_group_attachment" {
  count = var.create_lb ? length(aws_instance.my_web_server) : 0

  target_group_arn = aws_lb_target_group.this[0].arn
  target_id        = aws_instance.my_web_server[count.index].id
}
