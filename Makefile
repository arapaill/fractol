# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/05 10:54:05 by user42            #+#    #+#              #
#    Updated: 2021/08/05 10:57:52 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
MFLAGS =  -I minilibx -L minilibx -lmlx -framework OpenGL -framework AppKit
CFLAGS = -Wall -Wextra -Werror
SRC = src/main.c
NAME = cub3d
LIB = ar rcs
all : $(NAME)

$(NAME):	
			@make -C ./libft
			@cp ./libft/libft.a libft.a
			@$(CC) $(CFLAGS) $(MFLAGS) -o $(NAME) ${SRC} libft.a
			@echo "\n\033[32m[✓]\033[0m		[$(NAME) compiled libft]"
%.o: %.c
			$(CC) $(CFLAGS) -c -o $@ $<
clean:
			@rm -f *.o

fclean:	clean
			@rm -f $(NAME)
			@rm -f libft/libft.a
			@rm -f libft.a
			@rm -f libft/*.o
			
re:			fclean all

exec:		re
			@echo "\033[32m[✓]\033[0m		[$(NAME) and main.c compiled]"
			@echo "\033[32m[✓]\033[0m		[$(NAME) executed]\n"
			@./$(NAME)