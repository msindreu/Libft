NAME = libft.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra -MMD

SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

SRCS_BONUS = ft_lstnew_bonus.c

DEPS = $(addsuffix .d , $(basename $(SRS)))

OBJS = $(SRCS:.c=.o)

OBJS_BONUS = $(SRCS_BONUS:.c=.o)

%.o : %.c
	$(CC) $(CFLAGS) -I ./ -c $< -o $@

all: $(NAME)

-include $(DEPS)
$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS)

bonus:$(MAKE) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_BONUS)
	touch $@

clean:
	$(RM) $(OBJS) $(OBJS_BONUS) $(DEPS) bonus

fclean: clean
	$(RM) $(NAME)

re: fclean all
.PHONY: all clean fclean re

