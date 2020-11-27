# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ynoam </var/mail/ynoam>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/25 21:04:03 by ynoam             #+#    #+#              #
#    Updated: 2020/11/27 20:54:14 by ynoam            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRC = main.c ft_strlen.s ft_strcmp.s

# this line below : Any changes in main.s or ft_strlen.s will require \
# the generation of a new $(NAME) file.
all: $(NAME)
$(NAME): main.c $(SRC)
	###########################  Assembling...  #############################
	nasm -f macho64 ft_strlen.s
	nasm -f macho64 ft_strcmp.s
	ar rc $(NAME) ft_strlen.o ft_strcmp.o
	gcc -g main.c $(NAME)

clean:
	###########################  Delete the obj files...  ###################
	rm -f *.o

fclean: clean
	###########################  Delete the obj files and the lib ...  ######
	rm -f $(NAME)

re : fclean all

run:
		@./a.out | cat -e
