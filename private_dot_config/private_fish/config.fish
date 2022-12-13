set -x PATH $PATH /home/katams/.cargo/bin
starship init fish | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
