# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ynoam <ynoam@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/25 21:04:03 by ynoam             #+#    #+#              #
#    Updated: 2020/12/08 20:38:17 by ynoam            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRC = ft_strlen.s ft_strcmp.s ft_read.s ft_strcpy.s ft_strdup.s ft_write.s

# this line below : Any changes in main.s or ft_strlen.s will require \
# the generation of a new $(NAME) file.
all: $(NAME)
$(NAME): $(SRC)
	###########################  Assembling...  #############################
	nasm -g -f macho64 ft_strlen.s
	nasm -g -f macho64 ft_strcmp.s
	nasm -g -f macho64 ft_read.s
	nasm -g -f macho64 ft_strcpy.s
	nasm -g -f macho64 ft_strdup.s
	nasm -g -f macho64 ft_write.s
	ar rc $(NAME) *.o

clean:
	###########################  Delete the obj files...  ###################
	rm -f *.o

fclean: clean
	###########################  Delete the obj files and the lib ...  ######
	rm -f $(NAME)

re : fclean all

run:
		@./a.out | cat -e
