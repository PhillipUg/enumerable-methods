# enumerable-methods
An implementation of my own version of Ruby’s enumerable methods.

<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/PhillipUg/enumerable-methods">
    <img src="images/microverse.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Enumerable Methods</h3>

  <p align="center">
    This project is part of Microverse's curriculum in the Ruby module!
    <br />
    <a href="https://github.com/PhillipUg/enumerable-methods"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://repl.it/@PhillipUg/enumerable-methods">View Demo</a>
    <a href="https://github.com/PhillipUg/enumerable-methods/issues">Report Bug</a>
    <a href="https://github.com/PhillipUg/enumerable-methods/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Live Version](#live-version)
* [Acknowledgements](#acknowledgements)
* [License](#license)

<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://repl.it/@PhillipUg/enumerable-methods)

This is the second project of the Microverse Ruby Module. In this project, i implement some of the enumerable methods in the **Enumerable Module**. I didnt use any enumerable methods while doing so. Some of the methods i implemented include:
- #my_each
- #my_each_with_index
- #my_select 
- #my_all? 
- #my_any?
- #my_none?
- #my_count
- #my_map
- #my_inject


<!-- ABOUT THE PROJECT -->
## Testing

To test the code you need to give it some test cases like the ones written below and execute them on [repl.it](https://repl.it) : 

```
  p [1, 2, 3].my_each { |elem| print "#{elem + 1} " } # => 2 3 4
  p [1, 2, 3, 8].my_select(&:even?) # => [2, 8]
  p %w[dog door rod blade].my_all?(/d/) # => true
  p [1, nil, false].my_any?(Integer) # => true
  p [3, 5, 7, 11].my_none?(&:even?) # => true
  p %w[DANIEL JIA KRITI dave].my_count { |s| s == s.upcase } # => 3
  p [1, 2, 3].my_map { |n| 2 * n } # => [2,4,6]
  p (5..10).my_inject(4) { |prod, n| prod * n } # should return 604800

```

### Built With
This project was built using these technologies.
* Ruby
* Rubocop
* VsCode

<!-- LIVE VERSION -->
## Live version

You can see it working [here](https://repl.it/@PhillipUg/enumerable-methods)

<!-- CONTACT -->
## Contributors


:bust_in_silhouette: **Author**

- LinkedIn: [Phillip Musiime](https://www.linkedin.com/in/phillip-musiime-74657019a/)
- GitHub: [PhillipUg](https://github.com/PhillipUg)
- Twitter: [@Phillip_Ug](https://twitter.com/Phillip_Ug)
- E-mail: phillipmusiime@gmail.com


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/PhillipUg/enumerable-methods.svg?style=flat-square
[contributors-url]: https://github.com/PhillipUg/enumerable-methods/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/PhillipUg/enumerable-methods.svg?style=flat-square
[forks-url]: https://github.com/PhillipUg/enumerable-methods/network/members
[stars-shield]: https://img.shields.io/github/stars/PhillipUg/enumerable-methods.svg?style=flat-square
[stars-url]: https://github.com/PhillipUg/enumerable-methods/stargazers
[issues-shield]: https://img.shields.io/github/issues/PhillipUg/enumerable-methods.svg?style=flat-square
[issues-url]: https://github.com/PhillipUg/enumerable-methods/issues
[product-screenshot]: images/enumerable-methods.jpg

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
