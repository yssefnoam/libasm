# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ynoam <ynoam@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/25 21:04:03 by ynoam             #+#    #+#              #
#    Updated: 2020/12/10 12:47:41 by ynoam            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRC = ft_strlen.s ft_strcmp.s ft_read.s ft_strcpy.s ft_strdup.s ft_write.s

# this line below : Any changes $(SRC) will require the generation of a new $(NAME) file.

all: $(NAME)

$(NAME): $(SRCS) Makefile
	@nasm -g -f macho64 ft_strlen.s
	@nasm -g -f macho64 ft_strcmp.s
	@nasm -g -f macho64 ft_read.s
	@nasm -g -f macho64 ft_strcpy.s
	@nasm -g -f macho64 ft_strdup.s
	@nasm -g -f macho64 ft_write.s
	@ar rc $(NAME) *.o
	@echo "Compilation of $(NAME):  \033[1;32mOK\033[m"

clean:
	@rm -f *.o
	@echo "Delete *.o:               \033[1;32mOK\033[m"

fclean: clean
	@rm -f $(NAME)
	@echo "Delete $(NAME):          \033[1;32mOK\033[m"

re : fclean all