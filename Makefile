# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ynoam </var/mail/ynoam>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/25 21:04:03 by ynoam             #+#    #+#              #
#    Updated: 2020/11/27 12:18:02 by ynoam            ###   ########.fr        #
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
	nasm -f macho64 $(SRC)
	ar rc $(NAME) ft_strlen.o
	gcc main.c ft_strlen.o

clean:
	###########################  Delete the obj files...  ###################
	rm -f *.o

fclean: clean
	###########################  Delete the obj files and the lib ...  ######
	rm -f $(NAME)

re : fclean all
