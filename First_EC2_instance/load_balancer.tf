resource "aws_lb_target_group" "tg" {
    name = var.target_group_name
    port = var.target_group_port
    target_type = "instance"
    protocol = var.target_group_protocol
    vpc_id = var.vpc_id 
}


resource "aws_alb_target_group_attachment" "tgattachment" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.firstInstance.id
}

resource "aws_alb_target_group_attachment" "tgattachment2" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.secondInstance.id

}

resource "aws_lb" "lb" {
    security_groups =  [aws_security_group.sg.id]
    subnets =  [var.subnet_one_id, var.subnet_two_id ] #Not Sure 
}


resource "aws_lb_listener" "front_end" {
    load_balancer_arn = aws_lb.lb.arn
    port = var.load_balancer_listener_port
    protocol = var.load_balancer_listener_protocol

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
    }


}

resource "aws_lb_listener_rule" "static" {
    listener_arn = aws_lb_listener.front_end.arn
    priority = 100

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }

    condition {
        path_pattern {
            values = ["/test"]
        }
    }

}


