# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ynoam </var/mail/ynoam>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/25 21:04:03 by ynoam             #+#    #+#              #
#    Updated: 2020/10/04 21:16:07 by ynoam            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
#SRC = main.s
SRC = ft_strlen.s

# this line below : Any changes in main.s or ft_strlen.s will require \
# the generation of a new $(NAME) file.
all: $(NAME)
$(NAME): main.c $(SRC)
	###########################  Assembling...  #############################
#	nasm -g -f elf64 $(SRC)
#	nasm -g -f elf64 ft_strlen.s
#	ar rc $(NAME) ft_strlen.o
#	ld -g main.o libasm.a
#	rm *.o
	nasm -g -f elf64 $(SRC)
	ar rc $(NAME) ft_strlen.o
	gcc -c main.c
	gcc main.o ft_strlen.o
	rm *.o

clean:
	###########################  Delete the obj files...  ###################
	rm -f *.o

fclean: clean
	###########################  Delete the obj files and the lib ...  ######
	rm -f $(NAME)

re : fclean all

